fastq-dump --gzip --split-files SRR34103838 SRR34103839 SRR34103840 SRR34103841 SRR34103842 SRR34105446 SRR34105447 SRR34105448 SRR34105449 SRR34105450

trim_galore -q 30 --paired SRR34103838_1.fastq.gz SRR34103838_2.fastq.gz
trim_galore -q 30 --paired SRR34103839_1.fastq.gz SRR34103839_2.fastq.gz
trim_galore -q 30 --paired SRR34103840_1.fastq.gz SRR34103840_2.fastq.gz
trim_galore -q 30 --paired SRR34103841_1.fastq.gz SRR34103841_2.fastq.gz
trim_galore -q 30 --paired SRR34103842_1.fastq.gz SRR34103842_2.fastq.gz

#conda create -n hybracter_env python=3.11
conda activate hybracter_env
#conda install -c conda-forge -c bioconda hybracter

hybracter install

conda list -n hybracter_env > hybracter_env_packages.txt
conda env export > hybracter_env.yaml

hybracter hybrid -i hybracter.csv -o hybracter-hybrid -t 12



