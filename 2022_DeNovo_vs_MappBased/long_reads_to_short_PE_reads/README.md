# 🧬 Create short PE reads from long reads
To test different approaches for assembling genomes, I needed data with known microbial content. Only long reads were available, but I needed to test the algorithm on short paired-end reads. This script was written to create short reads from long reads. 

🤗 I would appreciate feedback if you find bugs in the code or in the logic of the program. Please dm me (@KaterinaPantiuk) / Twitter

<i> sample.fasta </i> - input data example <br>

<i> cut_long_reads.py </i> - step 1. Script for extracting short reads from long reads as drawn at scheme below <br>
<i> cut_zero_reads.py </i> - step 2. Script to filter a pair of reads if one or both reads in the pair are shorter than 100 bp <br>

Schematic representation of reads cutting:

![IMG_6967](https://user-images.githubusercontent.com/15068419/192989967-8b783044-ee19-4a10-91b3-e9745a0208a4.jpg)
