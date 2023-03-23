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

#### Run liftover on EnhancerAtlas_2.0_Fetal_brain_hg19.bed to get mm10 EnhancerAtlas_2.0_Fetal_brain_mm10.bed


### Get full human enhancer set (hg19) - download from http://www.enhanceratlas.org/downloadv2.php
```
mv hs.bed EnhancerAtlas_2.0_hs_hg19.bed
```

### Get mouse brain enhancers (mm9)
```
wget http://enhanceratlas.org/data/download/enhancer/mm/Brain.bed
mv Brain.bed EnhancerAtlas_2.0_brain_mm9.bed
```

### Get mouse E14.5 brain enhancers (mm9)
```
wget http://enhanceratlas.org/data/download/enhancer/mm/Brain_E14.5.bed
mv Brain_E14.5.bed EnhancerAtlas_2.0_Brain_E14.5_mm9.bed
```

### Get full mouse enhancer set (mm9) - download from http://www.enhanceratlas.org/downloadv2.php
```
mv mm.bed EnhancerAtlas_2.0_mm_mm9.bed
```

