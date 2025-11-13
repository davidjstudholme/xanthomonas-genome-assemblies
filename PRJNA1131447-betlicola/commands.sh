./fastq-dump --gzip --split-files SRR29695152 SRR29695153 SRR30036952 SRR30036953

trim_galore -q 30 --paired SRR29695153_1.fastq.gz SRR29695153_2.fastq.gz

#conda create -n hybracter_env python=3.11
conda activate hybracter_env
#conda install -c conda-forge -c bioconda hybracter

hybracter install

conda list -n hybracter_env > hybracter_env_packages.txt
conda env export > hybracter_env.yaml

hybracter hybrid -i PRJNA1131447.csv -o hybracter-hybrid -t 12

#conda create -n unicycler_env
conda activate unicycler_env
#conda install bioconda::unicycler

conda list -n unicycler_env > unicycler_env_packages.txt
conda env export > unicycler_env.yaml

unicycler -l SRR30036952_1.fastq.gz -1 SRR29695153_1.fastq.gz -2 SRR29695153_2.fastq.gz -o NCPPB_485.unfiltered.unicycler
unicycler -l SRR30036952_1.fastq.gz -1 SRR29695153_1_val_1.fq.gz -2 SRR29695153_2_val_2.fq.gz -o NCPPB_485.unicycler
