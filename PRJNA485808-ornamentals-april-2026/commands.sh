trim_galore -q 30 --paired 20901016_S109_R1_001.fastq.gz 20901016_S109_R2_001.fastq.gz
trim_galore -q 30 --paired N_2918_S114_R1_001.fastq.gz   N_2918_S114_R2_001.fastq.gz
trim_galore -q 30 --paired N_3883_S115_R1_001.fastq.gz   N_3883_S115_R2_001.fastq.gz
trim_galore -q 30 --paired N_3884_S116_R1_001.fastq.gz   N_3884_S116_R2_001.fastq.gz
trim_galore -q 30 --paired N_4416__S108_R1_001.fastq.gz  N_4416__S108_R2_001.fastq.gz
trim_galore -q 30 --paired N_942_S113_R1_001.fastq.gz    N_942_S113_R2_001.fastq.gz

#conda create -n unicycler_env
conda activate unicycler_env
#conda install bioconda::unicycler

conda list -n unicycler_env > unicycler_env_packages.txt
conda env export > unicycler_env.yaml

unicycler -1 20901016_S109_R1_001_val_1.fq.gz -2 20901016_S109_R2_001_val_2.fq.gz -o 20901016_WHRI_8524.unicycler
unicycler -1 N_2918_S114_R1_001_val_1.fq.gz -2 N_2918_S114_R2_001_val_2.fq.gz -o NCPPB_2918.unicycler
unicycler -1 N_3883_S115_R1_001_val_1.fq.gz -2 N_3883_S115_R2_001_val_2.fq.gz -o NCPPB_3883.unicycler
unicycler -1 N_3884_S116_R1_001_val_1.fq.gz -2 N_3884_S116_R2_001_val_2.fq.gz -o NCPPB_3884.unicycler
unicycler -1 N_4416__S108_R1_001_val_1.fq.gz -2 N_4416__S108_R2_001_val_2.fq.gz -o NCPPB_4416.unicycler
unicycler -1 N_942_S113_R1_001_val_1.fq.gz -2 N_942_S113_R2_001_val_2.fq.gz -o NCPPB_942.unicycler
