params.refGenomeEColi = "RefGenome_e_coli.fna.gz"
params.refMmi = "ref.mmi"
params.actualReadesFromEColiWithoutFormat = "SRR_e_coli_fastq"
params.outDir = "$baseDir/../Part3/out"
params.inputDir = "$baseDir/../Part3/inputFiles"
params.threadsCount = 8
params.parsePyScript = "test1.py"

process minimap2Index {
    publishDir "${params.outDir}", mode: 'copy'

    output:
      path "*.mmi", emit: refMmi

    script:
    """
    minimap2 -d ${params.refMmi} "${params.inputDir}/${params.refGenomeEColi}"
    """ 
}

process fastqGo {
    script:
    """
    fastqc "${params.inputDir}/${params.actualReadesFromEColiWithoutFormat}.gz" -o ${params.outDir}
    rm "${params.outDir}/${params.actualReadesFromEColiWithoutFormat}_fastqc.zip"
    """
}

process runBWAAlgos {
    publishDir "${params.outDir}", mode: 'copy'

    output:
      path "*.sam", emit: samchanski

    script:
    """
    minimap2 -t ${params.threadsCount} -a ${params.outDir}/ref.mmi ${params.inputDir}/${params.actualReadesFromEColiWithoutFormat}.gz > minimap_sam_result.sam
    """
}

process flagstatAnylysis {
    publishDir "${params.outDir}", mode: 'copy'

    input:
      path samchanski

    output:
      path "*.txt", emit: resultTxt

    script:
    """
    samtools flagstat $samchanski > flagstat_result.txt
    """
}

process parsePercent {
      publishDir "${params.outDir}", mode: 'copy'

    input:
      path resultTxt

    output:
      stdout

    script:
    """
    python3 ${params.inputDir}/${params.parsePyScript} $resultTxt
    """
}

workflow {
  minimap2Index()
  fastqGo()
  runBWAAlgos()
  flagstatAnylysis(runBWAAlgos.out.samchanski)
  parsePercent(flagstatAnylysis.out.resultTxt) | view
}
