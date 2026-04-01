



trim_galore -q 30 --paired 12037_1231_S68_R1_001_fastp.fastq.gz 12037_1231_S68_R2_001_fastp.fastq.gz
trim_galore -q 30 --paired 12037_1236_S69_R1_001_fastp.fastq.gz 12037_1236_S69_R2_001_fastp.fastq.gz
trim_galore -q 30 --paired 12037_1639_S44_R1_001_fastp.fastq.gz 12037_1639_S44_R2_001_fastp.fastq.gz
trim_galore -q 30 --paired 12037_2349_S45_R1_001_fastp.fastq.gz 12037_2349_S45_R2_001_fastp.fastq.gz
trim_galore -q 30 --paired 12037_3074_S46_R1_001_fastp.fastq.gz 12037_3074_S46_R2_001_fastp.fastq.gz
trim_galore -q 30 --paired 12037_355_S42_R1_001_fastp.fastq.gz 12037_355_S42_R2_001_fastp.fastq.gz
trim_galore -q 30 --paired 12037_552_S43_R1_001_fastp.fastq.gz 12037_552_S43_R2_001_fastp.fastq.gz

#conda create -n unicycler_env
conda activate unicycler_env
#conda install bioconda::unicycler

conda list -n unicycler_env > unicycler_env_packages.txt
conda env export > unicycler_env.yaml

unicycler -1 12037_1231_S68_R1_001_fastp_val_1.fq.gz -2 12037_1231_S68_R2_001_fastp_val_2.fq.gz -o NCPPB_1231.unicycler
unicycler -1 12037_1236_S69_R1_001_fastp_val_1.fq.gz -2 12037_1236_S69_R2_001_fastp_val_2.fq.gz -o NCPPB_1236.unicycler
unicycler -1 12037_1639_S44_R1_001_fastp_val_1.fq.gz -2 12037_1639_S44_R2_001_fastp_val_2.fq.gz -o NCPPB_1639.unicycler
unicycler -1 12037_2349_S45_R1_001_fastp_val_1.fq.gz -2 12037_2349_S45_R2_001_fastp_val_2.fq.gz -o NCPPB_2349.unicycler
unicycler -1 12037_3074_S46_R1_001_fastp_val_1.fq.gz -2 12037_3074_S46_R2_001_fastp_val_2.fq.gz -o NCPPB_3074.unicycler
unicycler -1 12037_355_S42_R1_001_fastp_val_1.fq.gz -2 12037_355_S42_R2_001_fastp_val_2.fq.gz -o NCPPB_355.unicycler
unicycler -1 12037_552_S43_R1_001_fastp_val_1.fq.gz -2 12037_552_S43_R2_001_fastp_val_2.fq.gz -o NCPPB_552.unicycler



#conda create -n hybracter_env python=3.11
conda activate hybracter_env
#conda install -c conda-forge -c bioconda hybracter

hybracter install

conda list -n hybracter_env > hybracter_env_packages.txt
conda env export > hybracter_env.yaml

hybracter hybrid -i hybracter.csv -o hybracter-hybrid -t 12






