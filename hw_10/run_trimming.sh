#!/bin/bash
#SBATCH --job-name=trimming              # Название задачи
#SBATCH --output=trim.log                # Лог-файл стандартного вывода
#SBATCH --error=trim.err                 # Лог-файл стандартной ошибки
#SBATCH --time=00:30:00                  # Время выполнения (чч:мм:сс)
#SBATCH --cpus-per-task=4                # Количество CPU
#SBATCH --mem=4G                         # Объём памяти
#SBATCH --partition=short               # Имя очереди (уточните на вашем кластере)

# Инициализация conda
source ~/miniconda3/etc/profile.d/conda.sh
conda activate trimming

# Запуск Trimmomatic в режиме paired-end
trimmomatic PE -threads 4 \
~/homework_bioinformatics_2025/hw_10/output_1_paired.fastq \
~/homework_bioinformatics_2025/hw_10/output_2_paired.fastq \
output_1_paired_final.fastq output_1_unpaired_final.fastq \
output_2_paired_final.fastq output_2_unpaired_final.fastq \
ILLUMINACLIP:~/homework_bioinformatics_2025/hw_10/adapters.fa:2:30:10 \
LEADING:20 TRAILING:20 SLIDINGWINDOW:4:15 MINLEN:36 CROP:150

