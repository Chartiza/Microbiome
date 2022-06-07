# ESTbiobank-Microbiome
scripts for microbiome analysis

## 2022_reads_number_Path.sh
- 🧬 Calculate the number of reads for all *.fq.gz files in the folder

## 2022_kraken_top_species.ipynb
- 🤗 For identification the most represented spesies in samples set with the biggest reads number per each sample
- 🦠 Input files are the output of kraken-report
- 💌 Output is the boxplot and a table
- 👋 You can change number of top species and per species reads threshhold

![image](https://user-images.githubusercontent.com/15068419/170773473-4b9f708d-cc15-4c0a-8730-5d9bd4f0c2c3.png)


## 2022_kraken_top_rank.ipynb
- 🤗 For identification the most represented genus or other taxonomic rank among the metagenome samples
- 🦠 Input files are the output of kraken-report
- 💌 Output is the boxplot and a table
- 👋 You can change taxon rank and filtering level

![image](https://user-images.githubusercontent.com/15068419/170773564-47cd39c0-cf70-4262-83d4-c39f0158f054.png)

## 2022_kraken_Phylum_microbiome_composition.ipynb
- 🤗 For identification most abundant Phylum in microbiomes across some cohort subjects
- 🦠 Input files are the output of kraken-report
- 💌 Output is the boxplot and a table
- 👋 You can caclulate reads number or reads percent

![image](https://user-images.githubusercontent.com/15068419/170773099-fc7b2d32-3fb1-473d-8c7c-dc2cd0462833.png)

## 2022_kraken_Domain_microbiome_composition.ipynb
- 🤗 For identification Domain level microbiome composition across some cohort subjects
- 🦠 Input files are the output of kraken-report
- 💌 Output is the boxplot and a table
- 👋 You can caclulate reads number or reads percent
