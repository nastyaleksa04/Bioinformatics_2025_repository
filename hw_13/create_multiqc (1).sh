#!/bin/bash
#SBATCH --job-name=fastqc_multiqc       # Название задачи
#SBATCH --output=fastqc_multiqc.log     # Лог-файл
#SBATCH --error=fastqc_multiqc.err      # Файл с ошибками
#SBATCH --time=00:30:00                 # Максимальное время выполнения (30 мин)
#SBATCH --cpus-per-task=4               # 4 CPU на задачу
#SBATCH --mem=4G                        # 4 ГБ RAM
#SBATCH --partition=short            # Стандартная партиция (может отличаться в вашем кластере)

source ~/miniconda3/etc/profile.d/conda.sh
conda activate fastqc
cd ~/homework_bioinformatics_2025/hw_13
mkdir -p fastqc_results/after_trimming

fastqc ~/homework_bioinformatics_2025/hw_13/hm_rna_seq/*.fastq -o ~/homework_bioinformatics_2025/hw_13/fastqc_results/after_trimming




source ~/miniconda3/etc/profile.d/conda.sh
conda activate multiqc
cd ~/homework_bioinformatics_2025/hw_13
mkdir -p multiqc_report/after_trimming

multiqc fastqc_results/after_trimming -o multiqc_report/after_trimming
