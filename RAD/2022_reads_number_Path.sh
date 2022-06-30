#!/bin/bash

for FQ in /home/project/reads/S1_*_nohost.fq.gz ; do
	NN=`basename $FQ`
	NAME=`echo "$NN" | cut -d'_' -f2`
	echo -n $NAME >> ReadsNumb.csv
	echo -n ' ' >> ReadsNumb.csv
	echo $(zcat $FQ |wc -l)/4|bc >> ReadsNumb.csv

done
