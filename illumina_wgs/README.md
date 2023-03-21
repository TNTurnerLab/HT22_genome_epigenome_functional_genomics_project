# This directory contains the information on running the Illumina whole-genome sequencing data.

Author: Tychele N. Turner, Ph.D.

Date: March 18, 2023

## Mapping Reads
### Server submssion (run on WashU RIS LSF server, basic submission components listed below)
```
bsub -R 'span[hosts=1] rusage[mem=300G]' -n 31 -M 300G -q tychele -G compute-tychele -oo map_reads.oo -a "docker(tychelewustl/bwa:version1)" sh map_reads.sh
```

### Resource files

#### Reference Genome (mm10)
```
wget http://hgdownload.cse.ucsc.edu/goldenpath/mm10/bigZips/mm10.fa.gz
```

## DeepVariant
### Server submssion (run on WashU RIS LSF server, basic submission components listed below)
```
SAMPLE='HT22'
bsub -g /tychele/dv -n 8 -M 100GB -G compute-tychele -R 'rusage[mem=100GB] span[hosts=1]' -q tychele -oo "$SAMPLE"_deepvariant.oo -a 'docker(google/deepvariant:1.0.0)' sh deepvariant.sh "$SAMPLE"
```

###DeepVariant HTML report

`HT22.deepvariant.illumina.wgs.visual_report.html`


