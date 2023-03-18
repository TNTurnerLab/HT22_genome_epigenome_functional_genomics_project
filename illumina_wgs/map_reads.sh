#!/bin/bash
# Tychele N. Turner, Ph.D.
# Last update: March 18, 2023
# Illumina WGS analysis workflow

export PATH=/opt/conda/bin:$PATH

# set up the details
SAMPLE='HT22'
LIB='lib1'
FASTQ1='/path/to/HL2KHDSX5_CGGATCTACA-CTCGAAGGAA_L003_R1.fastq.gz'
FASTQ2='/path/to/HL2KHDSX5_CGGATCTACA-CTCGAAGGAA_L003_R2.fastq.gz'
REFERENCE='/path/to/mm10.fa'

# map the reads
/opt/conda/bin/bwa mem -t 31 -K 100000000 -Y -R "@RG\tID:HT22\tSM:HT22\tLB:lib1" "$REFERENCE" "$FASTQ1" "$FASTQ2" | /opt/conda/bin/samtools view -Sb > "$SAMPLE"."$LIB".bam

# sort the reads
samtools sort -o "$SAMPLE"."$LIB".sort.cram --output-fmt=CRAM --reference "$REFERENCE" -@ 31 -m 9G "$SAMPLE"."$LIB".bam

# index the reads
/opt/conda/bin/samtools index -@ 31 "$SAMPLE"."$LIB".sort.cram

# clean
rm *bam
mv HT22.lib1.sort.cram HT22.final.cram
mv HT22.lib1.sort.cram.crai HT22.final.cram.crai

