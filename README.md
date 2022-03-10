## genomeNexflow - Nextflow implementation of Genome Nexus annotation tools. 
**This code is designed to be used on Juno.**

Note that this implementation uses nextflow's DSL2 standard, and integration into non-DSL2 compliant systems may require modifications.  

---
### Resources

This repository is a nextflow + container based implementation of the Genome Nexus annotion tools located at:

 * https://github.com/genome-nexus/annotation-tools
 * https://github.com/genome-nexus/genome-nexus-annotation-pipeline
  
The docker container is located here:

 * https://hub.docker.com/repository/docker/price0416/tempo-nexus
  
---
### Test Data

Test data is provided in the input_test/ directory. The subdirectory nexus/ contains data provided by the genome nexus team, and the tempo/ directory contains data generated using the tempo pipeline.

---
### Parameters & Example Run

--inputDir
  * This parameter should point to a directory containing .vcf and/or .maf files that are to be input to Genome Nexus.
  
--outDir
  * This parameter should point to a directory where output is to be written.
  
--outname
  * This parameter will be used to determine the directory name in output and prefix output file names.
  
--runType
  * This parameter indicates whether the user is running whole genome or whole exome sequencing.  Must be one of "WGS", "WES".
  
  
The code can be executed as follows:
```
nextflow run genomeNexflow.nf --inputDir /path/to/genomeNexflow/test_input/tempo/ --outDir /path/to/genomeNexflow/output/ --outname testRun --runType WES
```
