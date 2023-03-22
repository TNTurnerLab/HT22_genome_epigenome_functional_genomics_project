#!/bin/bash
# Tychele N. Turner, Ph.D.
# Last update: March 22, 2023
# PacBio WGS DeepVariant Calling Script

SAMPLE="$1"
DATADIR='/path/to/PacBio_WGS/HT22/'
REFERENCE='/path/to/mm10.fa'

echo "$SAMPLE"
/opt/deepvariant/bin/run_deepvariant --model_type=PACBIO --ref="$REFERENCE" --reads "$DATADIR""$SAMPLE".final.cram --output_vcf="$SAMPLE".deepvariant.pacbio.wgs.vcf.gz --output_gvcf="$SAMPLE".deepvariant.pacbio.wgs.g.vcf.gz --num_shards=8

