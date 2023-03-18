# This directory contains the information on running the HT-22 Iso-Seq data.

Author: Tychele N. Turner, Ph.D.
Date: March 18, 2023

## Server submssion (run on WashU RIS LSF server, basic submission components listed below)
```
bsub -n 1 -M 100GB -G compute-tychele -R 'rusage[mem=100GB] span[hosts=1]' -q general -oo log.oo -a 'docker(tychelewustl/isoseq3:version1)' sh isoseq_analysis.sh
```

## Resource files

### Gencode Annotation

```
wget https://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_mouse/release_M31/gencode.vM31.chr_patch_hapl_scaff.annotation.gtf.gz
gunzip gencode.vM31.chr_patch_hapl_scaff.annotation.gtf.gz
```

### Primers (from PacBio manual) = `primers.fasta`

### Reference Genome (mm10)
```
wget http://hgdownload.cse.ucsc.edu/goldenpath/mm10/bigZips/mm10.fa.gz
```






