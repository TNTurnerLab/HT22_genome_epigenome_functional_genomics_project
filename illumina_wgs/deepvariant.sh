#!/bin/bash
# Tychele N. Turner, Ph.D.
# Last update: March 19, 2023
# Illumina WGS DeepVariant Calling Script

SAMPLE="$1"
DATADIR='/path/to/Illumina_WGS/HT22/'
REFERENCE='/path/to/mm10.fa'

echo "$SAMPLE"
/opt/deepvariant/bin/run_deepvariant --model_type=WGS --ref="$REFERENCE" --reads "$DATADIR""$SAMPLE".final.cram --output_vcf="$SAMPLE".deepvariant.illumina.wgs.vcf.gz --output_gvcf="$SAMPLE".deepvariant.illumina.wgs.g.vcf.gz --num_shards=8

