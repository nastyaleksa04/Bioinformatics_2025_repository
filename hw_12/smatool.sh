#!/bin/bash

#SBATCH --job-name=sam_sort     	# Job name
#SBATCH --cpus-per-task=40     	# Run on a single CPU
#SBATCH --mem=256gb            	# Job memory request
#SBATCH --time=1:55:00       	# Time limit hrs:min:sec
#SBATCH --output=/home/aalexandrova/homework_bioinformatics_2025/hw_12/genomics/sam/sam_slurm.log  # Standard output and error log
#SBATCH --partition=short
source ~/miniconda3/etc/profile.d/conda.sh
conda activate sam
cd ~/homework_bioinformatics_2025/hw_12/genomics/trimmed;
zcat ~/homework_bioinformatics_2025/hw_12/genomics/trimmed/aln_pe.sam.gz | samtools sort --threads 40 -o sorted_1.bam

