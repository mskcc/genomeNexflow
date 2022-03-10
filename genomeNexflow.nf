#!/usr/bin/env nextflow
nextflow.enable.dsl = 2

include { NexusAnnotateMaf } from './NexusAnnotateMaf' 

// User-set runtime parameters
outname          = params.outname

workflow {
  NexusAnnotateMaf(params.inputDir, "WES")
}


