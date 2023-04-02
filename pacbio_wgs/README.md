# This directory contains the information on running the PacBio whole-genome sequencing data.

Author: Tychele N. Turner, Ph.D.

Date: March 22, 2023

## HiCanu Assembly
### Server submission (run on WashU RIS LSF server, basic submission components listed below)
```
bsub -R 'span[hosts=1] rusage[mem=310G]' -g /tychele/dv -n 31 -M 310G -q tychele -G compute-tychele -oo HT22_hicanu.oo -a "docker(tychelewustl/canu:2.2)" sh running_hicanu.sh
```

## Hifiasm Assembly on PacBio Reads only

### Server submission (run on WashU RIS LSF server, basic submission components listed below)
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

### Server submission (run on WashU RIS LSF server, basic submission components listed below)
```
bsub -R 'span[hosts=1] rusage[mem=300G]' -g /tychele/dv -n 31 -M 300G -q tychele -G compute-tychele -oo map_reads.oo -a "docker(tychelewustl/pbseqtools:version1)" sh map_reads.sh
```

## DeepVariant
### Server submission (run on WashU RIS LSF server, basic submission components listed below)
```
SAMPLE='HT22'
bsub -g /tychele/dv -n 8 -M 100GB -G compute-tychele -R 'rusage[mem=100GB] span[hosts=1]' -q tychele -oo "$SAMPLE"_deepvariant.oo -a 'docker(google/deepvariant:1.0.0)' sh deepvariant.sh "$SAMPLE"
```

### DeepVariant HTML report
`HT22.deepvariant.pacbio.wgs.visual_report.html`

## mosdepth
### Get the mosdepth binary
```
wget https://github.com/brentp/mosdepth/releases/download/v0.3.3/mosdepth
```

### Server submission (run on WashU RIS LSF server, basic submission components listed below)
```
bsub -g /tychele/dv -n 8 -M 50GB -G compute-tychele -R 'rusage[mem=50GB] span[hosts=1]' -q general -oo "$SAMPLE"_"$CHROM"_mosdepth.oo -a 'docker(tychelewustl/pbseqtools:version1)' sh mosdepth.sh "$SAMPLE" "$CHROM"
```

### Run per chromosome, mouse has 19 autosomes
```
for i in {1..19}
do
sh submit_mosdepth.sh HT22 chr"$i"
done

sh submit_mosdepth.sh HT22 chrX
sh submit_mosdepth.sh HT22 chrY
```

### Post-mosdepth calculations
```
#combine to one file
zcat HT22_chr1.per-base.bed.gz HT22_chr2.per-base.bed.gz HT22_chr3.per-base.bed.gz HT22_chr4.per-base.bed.gz HT22_chr5.per-base.bed.gz HT22_chr6.per-base.bed.gz HT22_chr7.per-base.bed.gz HT22_chr8.per-base.bed.gz HT22_chr9.per-base.bed.gz HT22_chr10.per-base.bed.gz HT22_chr11.per-base.bed.gz HT22_chr12.per-base.bed.gz HT22_chr13.per-base.bed.gz HT22_chr14.per-base.bed.gz HT22_chr15.per-base.bed.gz HT22_chr16.per-base.bed.gz HT22_chr17.per-base.bed.gz HT22_chr18.per-base.bed.gz HT22_chr19.per-base.bed.gz HT22_chrX.per-base.bed.gz HT22_chrY.per-base.bed.gz > HT22_genome.per-base.bed

#get executable to convert bedGraph to bigWig
wget https://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64/bedGraphToBigWig
chmod +x bedGraphToBigWig

#get chromosome sizes
wget https://hgdownload-test.gi.ucsc.edu/goldenPath/mm10/bigZips/mm10.chrom.sizes

#sort the file
sort -k1,1 -k2,2n HT22_genome.per-base.bed > HT22_genome.per-base_sorted.bed

#bedGraph to bigWig
./bedGraphToBigWig HT22_genome.per-base_sorted.bed mm10.chrom.sizes HT22_genome.per-base_sorted.bw

#final file
mv HT22_genome.per-base_sorted.bw HT22_pacbio_genome.per-base_sorted.bw
```

