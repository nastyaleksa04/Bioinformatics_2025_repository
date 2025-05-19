#!/bin/bash

#SBATCH --job-name=gatk     	# Job name
#SBATCH --cpus-per-task=40     	# Run on a single CPU
#SBATCH --mem=256gb            	# Job memory request
#SBATCH --time=12:00:00       	# Time limit hrs:min:sec
#SBATCH --output=~/homework_bioinformatics_2025/hw_12/genomics/variant_calling/gatk_slurm.log  # Standard output and error log
#SBATCH --partition=medium
source ~/miniconda3/etc/profile.d/conda.sh
conda activate gatk

gatk HaplotypeCaller -I ~/homework_bioinformatics_2025/hw_12/genomics/trimmed/tagged.bam -R /projects/mipt_dbmp_biotechnology/GRCh38/Homo_sapiens.GRCh38.dna.primary_assembly.fa -O ~/homework_bioinformatics_2025/hw_12/genomics/variant_calling/variants.vcf

