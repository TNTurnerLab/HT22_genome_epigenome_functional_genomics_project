# This directory contains the information on running the PacBio whole-genome sequencing data.

Author: Tychele N. Turner, Ph.D.

Date: March 18, 2023

## HiCanu Assembly
### Server submssion (run on WashU RIS LSF server, basic submission components listed below)
```
bsub -R 'span[hosts=1] rusage[mem=310G]' -g /tychele/dv -n 31 -M 310G -q tychele -G compute-tychele -oo HT22_hicanu.oo -a "docker(tychelewustl/canu:2.2)" sh running_hicanu.sh
```







