# CNV estimation from DNA methylation sequencing data (RRBS)

This tutorial is based on [HMMcopy R package vignette](https://www.bioconductor.org/packages/release/bioc/html/HMMcopy.html)

**Used tools:**
> HMMcopy (R package)

**Used files:** 
> aligned reads (BAM file)

> reference genome (hg 19)
 
> wgEncodeCrgMapabilityAlign100mer.bigWig downloaded from [UCSC Golden path](http://hgdownload.cse.ucsc.edu/goldenpath/hg19/encodeDCC/wgEncodeMapability/)
           
           
### HMMCopy R package is designed to estimate copy number variation (CNV) from whole genome sequencing data (WGS). But, here I will use it to estimate CNV from Reduced Representative Bisulfite seqencing data -DNA Methylation-.
****************

HMMcopy consists of 2 parts:
1. terminal based tools
2. R package
**************

## To Start with 3 wig files will be generated from terminal based tool

1. A wig contains the read counts from the BAM file by using readCounter tool:
```
./readCounter -w 10000 sample.sorted.bam
```
3. A wig contains the gc content from reference geneome (fasta)
4. A wig contains the mappability counts from wgEncodeCrgMapabilityAlign100mer.bigWig file 
** I this case 100mer will be used because my the sequencing reads length is (150bp), for compatibility.





