process NexusAnnotateMaf {
  publishDir "${outDir}/${params.outName}/", mode: params.publishDirMode, pattern: "*.maf"

  input:
    path(inputDir)
    path(outDir)
   
  output:
    path("${params.outName}.genomeNexus.maf"), emit: nexusMaf

  script:
    if (params.runType == "WGS") {
      processType = "WGS"
    }
    else {
      processType = "WXS"
    }

    """
    bash /annotation-tools/annotation_suite_wrapper.sh \
      -i=${inputDir} \
      -o=${outDir}/${params.outName} \
      -m=${params.outName}.genomeNexus_merged_mutation.out \
      -c=CMO \
      -s=${processType} \
      -p=/annotation-tools

    cp ${params.outName}.genomeNexus_merged_mutation.out ${params.outName}.genomeNexus.maf
    """
}
