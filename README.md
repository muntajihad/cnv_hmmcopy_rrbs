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

## First, 3 wig files should be generated from "terminal based" tools of hmmcopy:
*follow the link to install the tools : [hmmcopy_utils](https://github.com/shahcompbio/hmmcopy_utils)*

1. A wig contains the read counts from the BAM file by using readCounter tool (-w determines the size of the window/bin, here I used 10kb) :
```
./readCounter -w 10000 sample.sorted.bam > sample.wig
```
2. A wig contains the gc content from reference geneome (fasta)
```
./mapCounter -w 10000 wgEncodeCrgMapabilityAlign100mer.bigWig > map.wig
```
3. A wig contains the mappability counts from wgEncodeCrgMapabilityAlign100mer.bigWig file 
** I this case 100mer will be used because my the sequencing reads length is (150bp), for compatibility.
```
./mapCounter -w 10000 sample.sorted.bam > gc.wig
```
********
## Now R time:
*HMMcopy is designed to plot one chr only each time (plotSegments), but the data we have is whole genome data. So, we should subset the data*
```
setwd("~/myfiles")
library(HMMcopy)
raw_data <- wigsToRangedData(readfile = "sample.wig" ,gcfile = "gc.wig" ,mapfile = "map.wig")
# subset the data, chr7 for example
raw_data <- raw_data[raw_data$chr=="chr7",]
corrected <- correctReadcount(raw_data)
parameters <- HMMsegment(corrected, getparam = TRUE) 
parameters$mu <- log(c(1, 1.4, 2, 2.7, 3, 4.5) / 2, 2)
parameters$m <- parameters$mu
segmented_copy <- HMMsegment(corrected, parameters)
plotSegments(corrected, segmented_copy)
```




