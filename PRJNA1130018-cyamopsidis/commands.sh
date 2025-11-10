./fastq-dump --gzip --split-files SRR30037601 SRR30037602 SRR30037603 SRR30037604 SRR30037605 SRR30037606 SRR29655428 SRR29655429 SRR29655430 SRR29655431 SRR29655432 SRR29655433

#conda create -n hybracter_env python=3.11
conda activate hybracter_env
#conda install -c conda-forge -c bioconda hybracter

hybracter install

conda list -n hybracter_env > hybracter_env_packages.txt
conda env export > hybracter_env.yaml

hybracter hybrid -i PRJNA1130018.csv -o hybracter-hybrid -t 12

conda activate unicycler_env
conda create -n unicycler_env
conda activate unicycler_env
conda install bioconda::unicycler

conda list -n unicycler_env > hybracter_env_packages.txt
conda env export > unicycler_env.yaml

unicycler -1 SRR29655430_1.fastq.gz -2 SRR29655430_2.fastq.gz -l SRR30037603_1.fastq.gz -o NCPPB_3204.unicycler
unicycler -1 SRR29655431_1.fastq.gz -2 SRR29655431_2.fastq.gz -l SRR30037604_1.fastq.gz -o NCPPB_2998.unicycler
unicycler -1 SRR29655432_1.fastq.gz -2 SRR29655432_2.fastq.gz -l SRR30037605_1.fastq.gz -o NCPPB_2997.unicycler
unicycler -1 SRR29655433_1.fastq.gz -2 SRR29655433_2.fastq.gz -l SRR30037606_1.fastq.gz -o NCPPB_2494.unicycler
