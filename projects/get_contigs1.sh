#!/bin/bash
#SBATCH -J get_contigs_Megahit_3a
#SBATCH --partition=main
#SBATCH -t 20:00:00
#SBATCH --error=megahit_err_8
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --cpus-per-task=12
#SBATCH --mem=32G
#SBATCH --mail-user=<pantiukh@gmail.com>
#SBATCH --mail-type=BEGIN,END,FAIL

input='/gpfs/space/GI/GV/EGCUT_data/omics_data/microbiomics/BGI_cleaned/'
module load broadwell/megahit/1.2.9

while read FQ; do

  NAMEs=`echo "$FQ" | cut -d'_' -f2`
  megahit -1 $input/$FQ/filtered_nohost1.fq.gz -2 $input/$FQ/filtered_nohost2.fq.gz -t 12 -o /gpfs/space/home/pantiukh/get_assembly/assembly_$NAMEs

done </gpfs/space/home/pantiukh/get_assembly/contigs_list.csv

module purge
