

trim_galore -q 30 --paired 12037_3219_S26_R1_001_fastp.fastq.gz 12037_3219_S26_R2_001_fastp.fastq.gz
trim_galore -q 30 --paired 12037_3445_S25_R1_001_fastp.fastq.gz 12037_3445_S25_R2_001_fastp.fastq.gz
trim_galore -q 30 --paired 12037_3792_S27_R1_001_fastp.fastq.gz 12037_3792_S27_R2_001_fastp.fastq.gz
trim_galore -q 30 --paired 12037_3983_S28_R1_001_fastp.fastq.gz 12037_3983_S28_R2_001_fastp.fastq.gz



#conda create -n hybracter_env python=3.11
conda activate hybracter_env
#conda install -c conda-forge -c bioconda hybracter

hybracter install

conda list -n hybracter_env > hybracter_env_packages.txt
conda env export > hybracter_env.yaml

hybracter hybrid -i hybracter.csv -o hybracter-hybrid -t 12



