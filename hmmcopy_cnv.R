# make sure that you have delete "chrM" from your wig files. 
library(HMMcopy)
setwd("<your file path>")
#read wig files
raw=wigsToRangedData("sample.wig","gc.wig","map.wig")
#normalization by correcting the reads
corrected=correctReadcount(raw)
# adjust parameters 
param <- HMMsegment(corrected, getparam = TRUE) 
param$m <- param$mu
segmented_copy <- HMMsegment(corrected, param)
plotSegments(corrected, segmented_copy,ylab="Relative Copy Number",xlab="Chromosomes")
