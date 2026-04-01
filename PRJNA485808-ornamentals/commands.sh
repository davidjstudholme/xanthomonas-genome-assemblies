
trim_galore -q 30 --paired 10303-A_S47_R1_001.fastq.gz 10303-A_S47_R2_001.fastq.gz
trim_galore -q 30 --paired 10304-A_S48_R1_001.fastq.gz 10304-A_S48_R2_001.fastq.gz
trim_galore -q 30 --paired 2023027163_S30_L001_R1_001.fastq.gz 2023027163_S30_L001_R2_001.fastq.gz


#conda create -n unicycler_env
conda activate unicycler_env
#conda install bioconda::unicycler

conda list -n unicycler_env > unicycler_env_packages.txt
conda env export > unicycler_env.yaml

unicycler -1 10303-A_S47_R1_001_val_1.fq.gz -2 10303-A_S47_R2_001_val_2.fq.gz -o 10303-A_S47.unicycler
unicycler -1 10304-A_S48_R1_001_val_1.fq.gz -2 10304-A_S48_R2_001_val_2.fq.gz -o 10304-A_S48.unicycler
unicycler -1 2023027163_S30_L001_R1_001_val_1.fq.gz  -2 2023027163_S30_L001_R2_001_val_2.fq.gz -o 2023027163.unicycler
