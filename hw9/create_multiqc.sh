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
cd ~/homework_bioinformatics_2025/hw9
mkdir -p fastqc_results

fastqc ~/homework_bioinformatics_2025/hw9/*.fastq.gz -o ~/homework_bioinformatics_2025/hw9/fastqc_results




source ~/miniconda3/etc/profile.d/conda.sh
conda activate multiqc
cd ~/homework_bioinformatics_2025/hw9
mkdir -p multiqc_report

multiqc fastqc_results/ -o multiqc_report/
