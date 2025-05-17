#!/bin/bash
#SBATCH --job-name=stringtie       # Название задачи
#SBATCH --output=stringtie.log     # Лог-файл
#SBATCH --error=stringtie.err      # Файл с ошибками
#SBATCH --time=02:00:00                 # Максимальное время выполнения (30 мин)
#SBATCH --cpus-per-task=8               # 4 CPU на задачу
#SBATCH --mem=48G                        # 4 ГБ RAM
#SBATCH --partition=short            # Стандартная партиция (может отличаться в вашем кластере)

source ~/miniconda3/etc/profile.d/conda.sh
conda activate stringtie
mkdir results_stringtie
stringtie Aligned.sortedByCoord.out.bam \
-G /projects/mipt_dbmp_biotechnology/GRCh38/Homo_sapiens.GRCh38.110.chr.gtf \
-o results_stringtie/transcripts.gtf \
-p 8

