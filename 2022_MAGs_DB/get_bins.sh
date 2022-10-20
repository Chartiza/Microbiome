#!/bin/bash
#SBATCH -J get_MAGs_1
#SBATCH --partition=amd
#SBATCH -t 80:00:00
#SBATCH --error=binning_err
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --cpus-per-task=12
#SBATCH --mem=32G
#SBATCH --mail-user=<pantiukh@gmail.com>
#SBATCH --mail-type=BEGIN,END,FAIL

module load minimap2/2.14
module load samtools/1.3.1
module load metabat/2.15
module load maxbin/2.2.7
module load py-vamb/3.0.7
module load das-tool/1.1.4

Read='/gpfs/space/GI/GV/EGCUT_data/omics_data/microbiomics/BGI_cleaned/'
Cont='/gpfs/space/home/pantiukh/strain_het/assembly_'
PWD='/gpfs/space/home/pantiukh/get_bins'

while read FQ; do

  NAMEs=`echo "$FQ" | cut -d'_' -f2`
  echo '###############################'
  echo $NAMEs
  echo $(date)
  echo '###############################'

  # Map reads to contigs
  mkdir -p $PWD/$NAMEs
  mkdir -p $PWD/$NAMEs/coverage
  minimap2 -d $PWD/$NAMEs/coverage/catalogue.mmi $Cont$NAMEs/final.contigs.fa
  minimap2 -t 12 -N 5 -ax sr $PWD/$NAMEs/coverage/catalogue.mmi $Read/$FQ/filtered_nohost1.fq.gz $Read/$FQ/filtered_nohost2.fq.gz | samtools view -F 4 -b --threads 12 > $PWD/$NAMEs/coverage/$NAMEs.bam
  samtools sort -o $PWD/$NAMEs/coverage/$NAMEs.sorted.bam $PWD/$NAMEs/coverage/$NAMEs.bam
  samtools index $PWD/$NAMEs/coverage/$NAMEs.sorted.bam $PWD/$NAMEs/coverage/$NAMEs.sorted.bam.bai

  # Get Bins with Metabat2
  echo 'run Metabat2'
  mkdir -p $PWD/$NAMEs/metabat
  jgi_summarize_bam_contig_depths --outputDepth $PWD/$NAMEs/coverage/$NAMEs.metabat.depth.txt $PWD/$NAMEs/coverage/$NAMEs.sorted.bam
  metabat2 -i $Cont$NAMEs/final.contigs.fa -a $PWD/$NAMEs/coverage/$NAMEs.metabat.depth.txt -o $PWD/$NAMEs/metabat/metabat -m 1500

  # Get Bins with Vamb
  echo 'run Vamb'
  vamb --outdir $PWD/$NAMEs/vamb/ --fasta $Cont$NAMEs/final.contigs.fa --bamfiles $PWD/$NAMEs/coverage/$NAMEs.bam --minfasta 50000
  for f in $PWD/$NAMEs/vamb/bins/* ; do
    bins=`echo "$f" | cut -d'/' -f10`
    mv -- "$PWD/$NAMEs/vamb/bins/$bins" "$PWD/$NAMEs/vamb/bins/vamb_$bins" ; done

  # Get Bins with Maxbin2
  echo 'run Maxbin2'
  mkdir -p $PWD/$NAMEs/maxbin
  python $PWD/depth_for_maxbin.py $NAMEs
  run_MaxBin.pl -thread 24 -min_contig_length 500 -contig $Cont$NAMEs/final.contigs.fa -out $PWD/$NAMEs/maxbin/maxbin -abund $PWD/$NAMEs/coverage/$NAMEs.maxbin.depth.txt

  # Choose best bins with a DAS-tool
  echo 'run DAS-tool'
  mkdir -p $PWD/$NAMEs/dastool
  sh Fasta_to_Contig2Bin.sh -i $PWD/$NAMEs/metabat/ -e fa > $PWD/$NAMEs/dastool/metabat.scaffolds2bin.tsv
  sh Fasta_to_Contig2Bin.sh -i $PWD/$NAMEs/vamb/bins/ -e fna > $PWD/$NAMEs/dastool/vamb.scaffolds2bin.tsv
  sh Fasta_to_Contig2Bin.sh -i $PWD/$NAMEs/maxbin/ -e fasta > $PWD/$NAMEs/dastool/maxbin.scaffolds2bin.tsv
  awk 'BEGIN {OFS = "\t"}{print $1,$5}' $PWD/$NAMEs/dastool/vamb.scaffolds2bin.tsv > $PWD/$NAMEs/dastool/vamb1.scaffolds2bin.tsv

  DAS_Tool -i $PWD/$NAMEs/dastool/metabat.scaffolds2bin.tsv,$PWD/$NAMEs/dastool/vamb1.scaffolds2bin.tsv,$PWD/$NAMEs/dastool/maxbin.scaffolds2bin.tsv -l metabat,vamb,maxbin -c $Cont$NAMEs/final.contigs.fa -o $PWD/$NAMEs/dastool/bins --write_bins --threads 12

  # Remove temp folders
  rm -r $PWD/$NAMEs/coverage
  rm -r $PWD/$NAMEs/metabat
  rm -r $PWD/$NAMEs/vamb
  rm -r $PWD/$NAMEs/maxbin

done </gpfs/space/home/pantiukh/get_bins/contigs_list_1smpls1.csv

module purge
