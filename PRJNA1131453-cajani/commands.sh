./fastq-dump --gzip --split-files SRR29694808 SRR29694809 SRR30037370 SRR30037371

trim_galore -q 30 --paired SRR29694808_1.fastq.gz SRR29694808_2.fastq.gz
trim_galore -q 30 --paired SRR29694809_1.fastq.gz SRR29694809_2.fastq.gz

#conda create -n hybracter_env python=3.11
conda activate hybracter_env
#conda install -c conda-forge -c bioconda hybracter

hybracter install

conda list -n hybracter_env > hybracter_env_packages.txt
conda env export > hybracter_env.yaml

hybracter hybrid -i PRJNA1131453.csv -o hybracter-hybrid -t 12

#conda create -n unicycler_env
conda activate unicycler_env
#conda install bioconda::unicycler

conda list -n unicycler_env > unicycler_env_packages.txt
conda env export > unicycler_env.yaml

unicycler -l SRR30037370_1.fastq.gz -1 SRR29694808_1.fastq.gz -2 SRR29694808_2.fastq.gz -o NCPPB_2063.unfiltered.unicycler
unicycler -l SRR30037371_1.fastq.gz -1 SRR29694809_1.fastq.gz -2 SRR29694809_2.fastq.gz -o NCPPB_573.unfiltered.unicycler

unicycler -l SRR30037370_1.fastq.gz -1 SRR29694808_1_val_1.fq.gz -2 SRR29694808_2_val_2.fq.gz -o NCPPB_2063.unicycler
unicycler -l SRR30037371_1.fastq.gz -1 SRR29694809_1_val_1.fq.gz -2 SRR29694809_2_val_2.fq.gz -o NCPPB_573.unicycler
