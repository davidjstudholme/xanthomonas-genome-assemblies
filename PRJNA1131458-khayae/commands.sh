./fastq-dump --gzip --split-files SRR29695059 SRR29695060 SRR30037787 SRR30037788

conda create -n hybracter_env python=3.11
conda activate hybracter_env
conda install -c conda-forge -c bioconda hybracter

hybracter install

conda list -n hybracter_env > hybracter_env_packages.txt
conda env export > hybracter_env.yaml

hybracter hybrid -i PRJNA1131458.csv -o hybracter-hybrid -t 12



