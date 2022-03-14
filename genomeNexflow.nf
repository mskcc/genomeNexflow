#!/usr/bin/env nextflow
nextflow.enable.dsl = 2

include { NexusAnnotateMaf } from './NexusAnnotateMaf' 

inputDir = file(params.inputDir).toAbsolutePath().toString()
outDir   = file(params.outDir).toAbsolutePath().toString()


if (!(params.runType in ['WGS','WES'])) {
  println 'ERROR: You need to set --runType (values: WGS, WES)'
  exit 1
}

workflow {
  NexusAnnotateMaf(inputDir, outDir)
}


