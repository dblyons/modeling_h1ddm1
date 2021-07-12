# modeling_h1ddm1

bsseq processing from
raw fastq to window-by-annotation style output

steps:
demultiplex
trim-galore
map with bsmap
compute per-base methylation score with bsmap's methratio.py
calculate average TE methylation score with my "make_wba_.....sh" script
massage data in R and shell, producing 2 tables: 
per-TE mCG per genotype and per-TE C+T (alongwith TE length) as coverage proxy

processed data is stored in /kingsley_1/3-analysis/bsseq/intermediate_file/
and backed up locally in /suboord_kingsley/backup_kingsley_1/3-analysis/bsseq/intermediate_file



