#!/bin/bash
# Tychele N. Turner, Ph.D.
# Last update: March 23, 2023
# mosdepth calculation

SAMPLE="$1"
CHROM="$2"
DATADIR='/path/to/alignmentFile/'
REFERENCE='/path/to/mm10.fa'

echo "$SAMPLE"
./mosdepth -t 8 -b 5000 -c "$CHROM" -f "$REFERENCE" "$SAMPLE"_"$CHROM" "$DATADIR""$SAMPLE".final.bam

