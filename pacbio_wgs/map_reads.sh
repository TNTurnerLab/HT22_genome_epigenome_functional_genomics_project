#!/bin/bash
#!/bin/bash
# Tychele N. Turner, Ph.D.
# Last update: March 18, 2023
# Map reads to reference genome

export PATH=/opt/conda/bin:$PATH

###SAMPLES HAVE TO BE ADDED TO READ GROUP FIELD
SAMPLE='HT22'
REFERENCE='/path/to/mm10.fa'
SMRTcell1='/path/to/kinetics/m64136_230127_224537.5mc.hifi_reads.bam'
SMRTcell2='/path/to/kinetics/m64136_230130_173712.5mc.hifi_reads.bam'
SMRTcell3='/path/to/kinetics/m64136_230201_043221.5mc.hifi_reads.bam'
SMRTcell4='/path/to/kinetics/m64136_230205_053720.5mc.hifi_reads.bam'
SMRTcell5='/path/to/kinetics/m64136_230207_183356.5mc.hifi_reads.bam'
SMRTcell6='/path/to/kinetics/m64136_230209_052845.5mc.hifi_reads.bam'

pbmm2 align --preset CCS --sort -j 30 -m 8G "$REFERENCE" "$SMRTcell1" "$SAMPLE"_SMRTcell1.movie.bam
pbmm2 align --preset CCS --sort -j 30 -m 8G "$REFERENCE" "$SMRTcell2" "$SAMPLE"_SMRTcell2.movie.bam
pbmm2 align --preset CCS --sort -j 30 -m 8G "$REFERENCE" "$SMRTcell3" "$SAMPLE"_SMRTcell3.movie.bam
pbmm2 align --preset CCS --sort -j 30 -m 8G "$REFERENCE" "$SMRTcell4" "$SAMPLE"_SMRTcell4.movie.bam
pbmm2 align --preset CCS --sort -j 30 -m 8G "$REFERENCE" "$SMRTcell5" "$SAMPLE"_SMRTcell5.movie.bam
pbmm2 align --preset CCS --sort -j 30 -m 8G "$REFERENCE" "$SMRTcell6" "$SAMPLE"_SMRTcell6.movie.bam

samtools merge -@ 31 "$SAMPLE".bam "$SAMPLE"_SMRTcell1.movie.bam "$SAMPLE"_SMRTcell2.movie.bam "$SAMPLE"_SMRTcell3.movie.bam "$SAMPLE"_SMRTcell4.movie.bam "$SAMPLE"_SMRTcell5.movie.bam "$SAMPLE"_SMRTcell6.movie.bam

samtools sort -o "$SAMPLE".final.bam --output-fmt=BAM --reference "$REFERENCE" -@ 30 -m 8G "$SAMPLE".bam

samtools index "$SAMPLE".final.bam

