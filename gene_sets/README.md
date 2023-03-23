# Genesets and Noncoding Regions Initial Commit

Author: Tychele N. Turner, Ph.D.

Date: March 23, 2023

## EnhancerAtlas 2.0
Please note from blatting a few sequences it looks as though EnhancerAtlas 2.0 is on hg19 genome build for human and mm9 for mouse.

### Get human fetal brain enhancers (hg19)
```
wget http://enhanceratlas.org/data/download/enhancer/hs/Fetal_brain.bed
mv Fetal_brain.bed EnhancerAtlas_2.0_Fetal_brain_hg19.bed
```

#### Run liftover (https://genome.ucsc.edu/cgi-bin/hgLiftOver) on EnhancerAtlas_2.0_Fetal_brain_hg19.bed to get mm10 EnhancerAtlas_2.0_Fetal_brain_mm10.bed
#### After running liftover, convert the output bed file (EnhancerAtlas_2.0_Fetal_brain_mm10.bed) to bigBed
```
wget http://hgdownload.cse.ucsc.edu/admin/exe/macOSX.x86_64/bedToBigBed
chmod +x bedToBigBed
sort -k1,1 -k2,2n EnhancerAtlas_2.0_Fetal_brain_mm10.bed > EnhancerAtlas_2.0_Fetal_brain_mm10_sorted.bed
~/Documents/Software/ucsc_executables/bedToBigBed EnhancerAtlas_2.0_Fetal_brain_mm10_sorted.bed ~/Documents/Software/ucsc_executables/mm10.chrom.sizes EnhancerAtlas_2.0_Fetal_brain_mm10.bb
rm EnhancerAtlas_2.0_Fetal_brain_mm10_sorted.bed
rm EnhancerAtlas_2.0_Fetal_brain_mm10.bed
```

### Get mouse brain enhancers (mm9)
```
wget http://enhanceratlas.org/data/download/enhancer/mm/Brain.bed
mv Brain.bed EnhancerAtlas_2.0_brain_mm9.bed
```

#### Run liftover (https://genome.ucsc.edu/cgi-bin/hgLiftOver) on EnhancerAtlas_2.0_brain_mm9.bed to get mm10 EnhancerAtlas_2.0_brain_mm10.bed
#### After running liftover, convert the output bed file (EnhancerAtlas_2.0_brain_mm10.bed) to bigBed
```
sort -k1,1 -k2,2n EnhancerAtlas_2.0_brain_mm10.bed > EnhancerAtlas_2.0_brain_mm10_sorted.bed
~/Documents/Software/ucsc_executables/bedToBigBed EnhancerAtlas_2.0_brain_mm10_sorted.bed ~/Documents/Software/ucsc_executables/mm10.chrom.sizes EnhancerAtlas_2.0_brain_mm10.bb
rm EnhancerAtlas_2.0_brain_mm10_sorted.bed
rm EnhancerAtlas_2.0_brain_mm10.bed
```

### Get mouse E14.5 brain enhancers (mm9)
```
wget http://enhanceratlas.org/data/download/enhancer/mm/Brain_E14.5.bed
mv Brain_E14.5.bed EnhancerAtlas_2.0_Brain_E14.5_mm9.bed
```

#### Run liftover (https://genome.ucsc.edu/cgi-bin/hgLiftOver) on EnhancerAtlas_2.0_Brain_E14.5_mm9.bed to get mm10 EnhancerAtlas_2.0_Brain_E14.5_mm10.bed
#### After running liftover, convert the output bed file (EnhancerAtlas_2.0_Fetal_brain_mm10.bed) to bigBed
```
sort -k1,1 -k2,2n EnhancerAtlas_2.0_Brain_E14.5_mm10.bed > EnhancerAtlas_2.0_Brain_E14.5_mm10_sorted.bed
~/Documents/Software/ucsc_executables/bedToBigBed EnhancerAtlas_2.0_Brain_E14.5_mm10_sorted.bed ~/Documents/Software/ucsc_executables/mm10.chrom.sizes EnhancerAtlas_2.0_Brain_E14.5_mm10.bb
rm EnhancerAtlas_2.0_Brain_E14.5_mm10_sorted.bed
rm EnhancerAtlas_2.0_Brain_E14.5_mm10.bed
```

## VISTA Enhancer Database
### Get the enhancers from VISTA website and liftover to mm10
### make bed to bigBed
```
sort -k1,1 -k2,2n vista_enhancer_browser_table_from_vista_website_03212023_mm10.bed > vista_enhancer_browser_table_from_vista_website_03212023_mm10_sorted.bed
~/Documents/Software/ucsc_executables/bedToBigBed vista_enhancer_browser_table_from_vista_website_03212023_mm10_sorted.bed ~/Documents/Software/ucsc_executables/mm10.chrom.sizes vista_enhancer_browser_table_from_vista_website_03212023_mm10.bb
rm vista_enhancer_browser_table_from_vista_website_03212023_mm10_sorted.bed
rm vista_enhancer_browser_table_from_vista_website_03212023_mm10.bed
```


