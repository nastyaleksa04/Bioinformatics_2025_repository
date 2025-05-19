#!/bin/sh

#SBATCH --job-name=bwa_wgs
#SBATCH --cpus-per-task=40
#SBATCH --mem=256G
#SBATCH --time=3-00:00:00
#SBATCH --output=/home/aalexandrova/homework_bioinformatics_2025/hw_12/genomics/align/bwa_slurm.log
#SBATCH --partition=long

cd /home/aalexandrova/homework_bioinformatics_2025/hw_12/genomics/trimmed;


bwa mem /projects/mipt_dbmp_biotechnology/GRCh38/Homo_sapiens.GRCh38.dna.primary_assembly.fa /home/aalexandrova/homework_bioinformatics_2025/hw_12/genomics/trimmed/trimmed_R1.fastq.gz /home/aalexandrova/homework_bioinformatics_2025/hw_12/genomics/trimmed/trimmed_R2.fastq.gz  | gzip -3 > /home/aalexandrova/homework_bioinformatics_2025/hw_12/genomics/trimmed/aln_pe.sam.gz
