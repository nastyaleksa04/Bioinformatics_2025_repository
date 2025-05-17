#!/bin/bash
#SBATCH --job-name=star       # Название задачи
#SBATCH --output=star.log     # Лог-файл
#SBATCH --error=star.err      # Файл с ошибками
#SBATCH --time=02:00:00                 # Максимальное время выполнения (30 мин)
#SBATCH --cpus-per-task=8               # 4 CPU на задачу
#SBATCH --mem=48G                        # 4 ГБ RAM
#SBATCH --partition=short            # Стандартная партиция (может отличаться в вашем кластере)

source ~/miniconda3/etc/profile.d/conda.sh
conda activate star

STAR --genomeDir /projects/mipt_dbmp_biotechnology/GRCh38/ \
--readFilesIn trimmed_R1.fastq trimmed_R2.fastq \
--runThreadN 8 \
--outFileNamePrefix star_output/ \
--outSAMtype BAM SortedByCoordinate \
--quantMode GeneCounts
