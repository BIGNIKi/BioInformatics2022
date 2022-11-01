minimap2 -d ref.mmi RefGenome_e_coli.fna.gz
fastqc SRR_e_coli_fastq.gz
rm SRR_e_coli_fastq_fastqc.zip
minimap2 -a ref.mmi SRR_e_coli_fastq.gz > minimap_sam_result.sam
samtools flagstat minimap_sam_result.sam > flagstat_result.txt
python3 test1.py flagstat_result.txt
