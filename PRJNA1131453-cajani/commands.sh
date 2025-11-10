./fastq-dump --gzip --split-files SRR29694808 SRR29694809 SRR30037370 SRR30037371


#conda create -n hybracter_env python=3.11
conda activate hybracter_env
#conda install -c conda-forge -c bioconda hybracter

hybracter install

conda list -n hybracter_env > hybracter_env_packages.txt
conda env export > hybracter_env.yaml

hybracter hybrid -i PRJNA1131453.csv -o hybracter-hybrid -t 12


