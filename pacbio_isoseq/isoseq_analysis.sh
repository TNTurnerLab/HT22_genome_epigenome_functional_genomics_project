#!/bin/bash
# Tychele N. Turner, Ph.D.
# Last update: March 18, 2023
# IsoSeq analysis workflow

export PATH=/opt/conda/bin:$PATH

inputSMRTbam='m64043_230124_190020.hifi_reads.bam'
SMRTname='HT22-isoseq'
REFERENCE='/path/to/mm10.fa'

#lima
lima --isoseq --dump-clips $inputSMRTbam primers.fasta "$SMRTname".hifi_reads.fl.bam --peek-guess --log-file lima.log

#refine
isoseq3 refine "$SMRTname".hifi_reads.fl.NEB_5p--NEB_Clontech_3p.bam primers.fasta "$SMRTname".flnc.bam

#cluster
isoseq3 cluster "$SMRTname".flnc.bam "$SMRTname".clustered.bam --verbose --use-qvs

#align
pbmm2 align --preset ISOSEQ --sort "$SMRTname".clustered.bam "$REFERENCE" "$SMRTname".clustered.mapped.bam

#collapse
isoseq3 collapse --do-not-collapse-extra-5exons "$SMRTname".clustered.mapped.bam "$SMRTname".gff

#sort
pigeon sort "$SMRTname".gff -o "$SMRTname".sorted.gff

#index
pigeon index gencode.v42.chr_patch_hapl_scaff.annotation.gtf

#classify
pigeon classify "$SMRTname".sorted.gff gencode.v42.chr_patch_hapl_scaff.annotation.gtf "$REFERENCE"

#filter
pigeon filter "$SMRTname"_classification.txt --isoforms "$SMRTname".sorted.gff

#report
pigeon report "$SMRTname"_classification.filtered_lite_classification.txt "$SMRTname"_saturation.txt

