# This directory contains the information on running the PacBio whole-genome sequencing data.

Author: Tychele N. Turner, Ph.D.

Date: March 18, 2023

## HiCanu Assembly
### Server submssion (run on WashU RIS LSF server, basic submission components listed below)
```
bsub -R 'span[hosts=1] rusage[mem=310G]' -g /tychele/dv -n 31 -M 310G -q tychele -G compute-tychele -oo HT22_hicanu.oo -a "docker(tychelewustl/canu:2.2)" sh running_hicanu.sh
```

## Hifiasm Assembly on PacBio Reads only

### Server submssion (run on WashU RIS LSF server, basic submission components listed below)
```
bsub -R 'span[hosts=1] rusage[mem=2700G]' -g /tychele/dv -n 62 -M 2700G -q tychele -G compute-tychele -oo ht22_hifiasm.oo -a "docker(tychelewustl/hifiasm:version2)" sh running_hifiasm_ht22.sh
```

### Post-Assembly Calculations for Hifiasm
```
bsub -g /tychele/dv -n 1 -M 100G -G compute-tychele -R 'rusage[mem=100G] span[hosts=1]' -q general-interactive -Is -a 'docker(tychelewustl/gfatools_caln50:version1)' /bin/bash

#in interactive run
sh post_hifiasm_ht22.sh
```

## Mapping reads to reference genome
### Resource files

#### Reference Genome (mm10)
```
wget http://hgdownload.cse.ucsc.edu/goldenpath/mm10/bigZips/mm10.fa.gz
```

### Server submssion (run on WashU RIS LSF server, basic submission components listed below)
```
bsub -R 'span[hosts=1] rusage[mem=300G]' -g /tychele/dv -n 31 -M 300G -q tychele -G compute-tychele -oo map_reads.oo -a "docker(tychelewustl/pbseqtools:version1)" sh map_reads.sh
```



