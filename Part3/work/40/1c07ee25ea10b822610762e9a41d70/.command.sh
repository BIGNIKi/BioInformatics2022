#!/bin/bash -ue
fastqc "/home/bignik/Documents/GitHub/BioInformatics2022/Part3/../Part3/inputFiles/SRR_e_coli_fastq.gz" -o /home/bignik/Documents/GitHub/BioInformatics2022/Part3/../Part3/out
rm "/home/bignik/Documents/GitHub/BioInformatics2022/Part3/../Part3/out/SRR_e_coli_fastq_fastqc.zip"
