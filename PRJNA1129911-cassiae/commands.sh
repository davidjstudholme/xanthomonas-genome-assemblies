./fastq-dump --gzip --split-files SRR29654627 SRR29654628 SRR29654629 SRR29654630 SRR30037585 SRR30037586 SRR30037587

trim_galore -q 30 --paired SRR29654630_1.fastq.gz SRR29654630_2.fastq.gz 

#conda create -n hybracter_env python=3.11
conda activate hybracter_env
#conda install -c conda-forge -c bioconda hybracter

hybracter install

conda list -n hybracter_env > hybracter_env_packages.txt
conda env export > hybracter_env.yaml

hybracter hybrid -i cassiae.csv -o hybracter-hybrid -t 12

#conda create -n unicycler_env
conda activate unicycler_env
#conda install bioconda::unicycler

conda list -n unicycler_env > unicycler_env_packages.txt
conda env export > unicycler_env.yaml

unicycler -1 SRR29654630_1_val_1.fq.gz  -2 SRR29654630_2_val_2.fq.gz -o NCPPB_478.unicycler
