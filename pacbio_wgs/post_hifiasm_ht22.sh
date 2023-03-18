#!/bin/bash
# Tychele N. Turner, Ph.D.
# Last update: March 18, 2023
# Post Hifiasm assessment

for i in *ctg.gfa
do
/gfatools/gfatools gfa2fa "$i" > "$i".ctg.fasta
done

for i in *.ctg.fasta
do
/opt/conda/bin/k8 calN50/calN50.js -f /path/to/mm10.fa.fai "$i" > "$i".stats.txt
done

