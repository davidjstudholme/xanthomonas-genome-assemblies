./fastq-dump --gzip --split-files SRR29655369 SRR29655370 SRR29655371 SRR30037966 SRR30037967 SRR30037968

#conda create -n hybracter_env python=3.11
conda activate hybracter_env
#conda install -c conda-forge -c bioconda hybracter

hybracter install

conda list -n hybracter_env > hybracter_env_packages.txt
conda env export > hybracter_env.yaml

hybracter hybrid -i rhynchosiae.csv -o hybracter-hybrid -t 12

trim_galore -q 30 --paired SRR29655371_1.fastq.gz SRR29655371_2.fastq.gz
trim_galore -q 30 --paired SRR29655369_1.fastq.gz SRR29655369_2.fastq.gz
trim_galore -q 30 --paired SRR29655370_1.fastq.gz SRR29655370_2.fastq.gz

#conda create -n unicycler_env
conda activate unicycler_env
#conda install bioconda::unicycler

conda list -n unicycler_env > hybracter_env_packages.txt
conda env export > unicycler_env.yaml

unicycler -1 SRR29655371_1_val_1.fq.gz -2 SRR29655371_2_val_2.fq.gz -l SRR30037966_1.fastq.gz -o NCPPB_1827.unicycler
unicycler -1 SRR29655369_1_val_1.fq.gz -2 SRR29655369_2_val_2.fq.gz -l SRR30037967_1.fastq.gz -o NCPPB_2914.unicycler
unicycler -1 SRR29655370_1_val_1.fq.gz -2 SRR29655370_2_val_2.fq.gz -l SRR30037968_1.fastq.gz -o NCPPB_2060.unicycler

