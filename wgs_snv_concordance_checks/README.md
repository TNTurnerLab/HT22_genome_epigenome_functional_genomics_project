# This directory contains the analysis to check concordance of SNV/indel call from DeepVariant from PacBio WGS and Illumina WGS

Author: Tychele N. Turner, Ph.D.
Date: March 22, 2023

## Run bcftools gtcheck
```
bcftools gtcheck --query-sample 20230110_HT_22_1_Fraction1_Fraction2 --target-sample HT22 -a -g /path/to/HT22.deepvariant.illumina.wgs.vcf.gz /path/to/HT22.deepvariant.pacbio.wgs.vcf.gz --GTs-only 1 | tail -2
```

## Summary result is here
`gtcheck_result_summary.txt`

