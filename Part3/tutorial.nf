params.refGenomeEColi = "RefGenome_e_coli.fna.gz"
params.refMmi = "ref.mmi"
params.actualReadesFromEColiWithoutFormat = "SRR_e_coli_fastq"
params.outDir = "$baseDir/../Part3/out"
params.inputDir = "$baseDir/../Part3/inputFiles"
params.threadsCount = 8
params.parsePyScript = "test1.py"

process index {
    publishDir "${params.outDir}", mode: 'copy'

    output:
      path "*.mmi", emit: refMmi

    script:
    """
    minimap2 -d ${params.refMmi} "${params.inputDir}/${params.refGenomeEColi}"
    """ 
}

process FastQC {
    publishDir "${params.outDir}", mode: 'copy'

    script:
    """
    mkdir -p ${params.outDir}
    fastqc "${params.inputDir}/${params.actualReadesFromEColiWithoutFormat}.gz" -o ${params.outDir}
    rm "${params.outDir}/${params.actualReadesFromEColiWithoutFormat}_fastqc.zip"
    """
}

process minimap2 {
    publishDir "${params.outDir}", mode: 'copy'

    input:
      path mmiFile

    output:
      path "*.sam", emit: samchanski

    script:
    """
    minimap2 -t ${params.threadsCount} -a $mmiFile ${params.inputDir}/${params.actualReadesFromEColiWithoutFormat}.gz > minimap_sam_result.sam
    """
}

process samtoolsFlagstat {
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
  index()
  FastQC()
  minimap2(index.out.refMmi)
  samtoolsFlagstat(minimap2.out.samchanski)
  parsePercent(samtoolsFlagstat.out.resultTxt) | view
}
