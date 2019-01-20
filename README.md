Reproducible example: BiocParallel::BatchtoolsParam()
=====================================================

This repository contains files and scripts to demonstrate
`BiocParallel::BatchtoolsParam()`. 

## Download data

In your current working directory, download the data from SRA.

	sh download_data.sh
	
This will create a folder called `data` with folders starting with
`DRR16`. Each folder will contain two `fastq.gz` files containing
paired end raw reads which need to be quantified.


## Make index

Download the Arabdopsis thaliana index or use the one provided.

Make the salmon index with the command

	salmon index -i athal_index -t athal.fa.gz

Presentation: http://bit.ly/scale-bioc

