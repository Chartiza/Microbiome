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
smpl1='lab64_VBBUAG_E100013123_L01/'
smpl2='lab64_VBC2EG_E100013108_L01/'
smpl3='lab64_VBCY6U_E100013421_L01/'

NAME1=`echo "$smpl1" | cut -d'_' -f2`
NAME2=`echo "$smpl2" | cut -d'_' -f2`
NAME3=`echo "$smpl3" | cut -d'_' -f2`

module load broadwell/megahit/1.2.9

megahit -1 $input/$smpl1/filtered_nohost1.fq.gz -2 $input/$smpl1/filtered_nohost2.fq.gz -t 12 -o /gpfs/space/home/pantiukh/strain_het/assembly_$NAME1
megahit -1 $input/$smpl2/filtered_nohost1.fq.gz -2 $input/$smpl2/filtered_nohost2.fq.gz -t 12 -o /gpfs/space/home/pantiukh/strain_het/assembly_$NAME2
megahit -1 $input/$smpl3/filtered_nohost1.fq.gz -2 $input/$smpl3/filtered_nohost2.fq.gz -t 12 -o /gpfs/space/home/pantiukh/strain_het/assembly_$NAME3

module purge
