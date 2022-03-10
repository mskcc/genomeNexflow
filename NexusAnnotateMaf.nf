process NexusAnnotateMaf {
  publishDir "${params.outDir}/${params.outname}/", mode: params.publishDirMode, pattern: "*.maf"

  input:
    path(inputDir)
    val(target)
   
  output:
    path("${params.outname}.genomeNexus.maf"), emit: nexusMaf

  script:
    if (target == "wgs") {
      processType = "WGS"
    }
    else {
      processType = "WXS"
    }

    """
    bash /annotation-tools/annotation_suite_wrapper.sh \
      -i=${inputDir} \
      -o=${params.outDir}/${params.outname} \
      -m=${params.outname}.genomeNexus_merged_mutation.out \
      -c=CMO \
      -s=${processType} \
      -p=/annotation-tools

    cp ${params.outname}.genomeNexus_merged_mutation.out ${params.outname}.genomeNexus.maf
    """
}
