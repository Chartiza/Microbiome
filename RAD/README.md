# ESTbiobank-Microbiome
Some useful scripts for microbiome analysis (Whole genome sequencing data)

### 2022_Abundance-Prevalence.ipynb
- 🤗 To vizualize Abundance-Prevalence plot
- 🦠 Manualy made table with taxonomic information as input

![All_phylum1](https://user-images.githubusercontent.com/15068419/182841026-427dfd97-19bb-498f-83cd-1535906c7f00.jpg)

### 2022_ReadsNumb_vs_ContigsStats.ipynb
- 🤗 To understand the impact of the number of reads on the quality of the assembly
- 🦠 Input files are the stats data were taken from MEGAHIT v1.2.9 log files after assemblies were done 

![RN_vs_ContStat](https://user-images.githubusercontent.com/15068419/176651799-2e631225-7133-45d3-bcc9-979191c9cf2d.jpg)

### 2022_reads_number_Path.sh
- 🧬 Calculate the number of reads for all *.fq.gz files in the folder

### 2022_kraken_top_species.ipynb
- 🤗 For identification the most represented spesies in samples set with the biggest reads number per each sample
- 🦠 Input files are the output of kraken-report
- 💌 Output is the boxplot and a table
- 👋 You can change number of top species and per species reads threshhold

![image](https://user-images.githubusercontent.com/15068419/170773473-4b9f708d-cc15-4c0a-8730-5d9bd4f0c2c3.png)


### 2022_kraken_top_rank.ipynb
- 🤗 For identification the most represented genus or other taxonomic rank among the metagenome samples
- 🦠 Input files are the output of kraken-report
- 💌 Output is the boxplot and a table
- 👋 You can change taxon rank and filtering level

![image](https://user-images.githubusercontent.com/15068419/170773564-47cd39c0-cf70-4262-83d4-c39f0158f054.png)

### 2022_kraken_Phylum_microbiome_composition.ipynb
- 🤗 For identification most abundant Phylum in microbiomes across some cohort subjects
- 🦠 Input files are the output of kraken-report
- 💌 Output is the boxplot and a table
- 👋 You can caclulate reads number or reads percent

![image](https://user-images.githubusercontent.com/15068419/170773099-fc7b2d32-3fb1-473d-8c7c-dc2cd0462833.png)

### 2022_kraken_Domain_microbiome_composition.ipynb
- 🤗 For identification Domain level microbiome composition across some cohort subjects
- 🦠 Input files are the output of kraken-report
- 💌 Output is the boxplot and a table
- 👋 You can caclulate reads number or reads percent
