#!/bin/bash
# Tychele N. Turner, Ph.D.
# Last update: March 18, 2023
# HiCanu analysis workflow

export PATH=/opt/conda/bin:$PATH

SAMPLE='HT22'

canu -p "$SAMPLE"_hicanu_assembly -d "$SAMPLE"_hicanu_assembly maxThreads=31 maxMemory=300 genomeSize=3g useGrid=false -pacbio-hifi /path/to/SMRTcell1/CCS_Data/m64136_230127_224537.hifi_reads.fastq.gz /path/to/SMRTcell2/CCS_Data/m64136_230130_173712.hifi_reads.fastq.gz /path/to/SMRTcell3/CCS_Data/m64136_230201_043221.hifi_reads.fastq.gz /path/to/SMRTcell4/CCS_Data/m64136_230205_053720.hifi_reads.fastq.gz /path/to/SMRTcell5/CCS_Data/m64136_230207_183356.hifi_reads.fastq.gz /path/to/SMRTcell6/CCS_Data/m64136_230209_052845.hifi_reads.fastq.gz

