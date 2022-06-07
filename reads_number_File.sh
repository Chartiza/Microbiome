#!/bin/bash
#SBATCH -J reads_numb
#SBATCH --partition=main
#SBATCH -t 20:00:00
#SBATCH --error=rn_error
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --cpus-per-task=6
#SBATCH --mem=2G
#SBATCH --mail-user=<pantiukh@gmail.com>
#SBATCH --mail-type=BEGIN,END,FAIL

Res='/gpfs/space/home/pantiukh/reads_numb/results'

while read p; do
	NN=`basename $p`
	NAME=`echo "$NN" | cut -d'_' -f1`
	echo -n $NAME >> $Res/ReadsNumb_FirstSet_p2.csv
	echo -n ' ' >> $Res/ReadsNumb_FirstSet_p2.csv
	echo $(zcat $p |wc -l)/4|bc >> $Res/ReadsNumb_FirstSet_p2.csv

done </gpfs/space/home/pantiukh/reads_numb/FirstSet_p2.csv
