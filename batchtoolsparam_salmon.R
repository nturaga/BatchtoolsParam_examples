## Load BiocParallel
library(BiocParallel)

## Initiate BatchtoolsParam with the 
param <- BatchtoolsParam(workers = 8, cluster = 'sge',
                         template = 'batchtoolsparam-sge.tmpl')

## Get vector of samples
DIR <- '/mnt/lustre/users/nturaga/RPCCC-HPC'
samples <- list.files(file.path(DIR, "data"), full.names=TRUE)


## Function to quantify a simple sample
salmon_quant <- 
    function(sample)
{
    fastq1 <- file.path(sample, paste0(basename(sample), "_1.fastq.gz"))
    fastq2 <- file.path(sample, paste0(basename(sample), "_2.fastq.gz"))
    output_dir <- '/mnt/lustre/users/nturaga/RPCCC-HPC/bpquant'
    system2("salmon",
            args = c("quant",
                     "-i", "/mnt/lustre/users/nturaga/RPCCC-HPC/athal_index",
                     "-l", "A",
                     "-1", fastq1,
                     "-2", fastq2,
                     "-p", "16",
                     "-o", output_dir)
            ) 
}

## Run bplapply with BatchtoolsParam
bplapply(samples, salmon_quant, BPPARAM = param)
