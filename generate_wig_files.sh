#!/bin/bash
sample = "/path/to/.bam"
ref= "/path/to/hg19.fa" #make sure your bam is sorted (e.g. by samtools sort)
map= "/path/to/wgEncodeCrgMapabilityAlign100mer.bigWig"

./readCounter -w 10000 $sample > sample.wig
./mapCounter -w 10000 $map > map.wig
./gcCounter -w 10000 $ref > gc.wig
