# modeling_h1ddm1
<br/>
bsseq processing from<br/>
raw fastq to window-by-annotation style output<br/>
<br/>
steps:<br/><br/>
<br/>
demultiplex<br/>
<br/>
trim-galore<br/>
<br/>
map with bsmap<br/>
<br/>
compute per-base methylation score with bsmap's methratio.py<br/>
<br/>
calculate average TE methylation score with <br/>make_wba_from_bsmap_output.sh<br/> 
  
<br/>
massage data in R using "processing_TEs" scripts and shell, producing 2 tables: <br/>
<br/>
per-TE mCG per genotype and per-TE C+T (alongwith TE length) as coverage proxy<br/>
<br/><br/>
processed data is stored in /kingsley_1/3-analysis/bsseq/intermediate_file/<br/>
and backed up locally in /suboord_kingsley/backup_kingsley_1/3-analysis/bsseq/intermediate_file<br/>



