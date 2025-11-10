./fastq-dump --gzip --split-files SRR29695343 SRR29695344 SRR29695345 SRR30037789 SRR30037790 SRR30037791

conda create -n hybracter_env python=3.11
conda activate hybracter_env
conda install -c conda-forge -c bioconda hybracter

hybracter install

conda list -n hybracter_env > hybracter_env_packages.txt
conda env export > hybracter_env.yaml

hybracter hybrid -i PRJNA1131460.csv -o hybracter-hybrid -t 12
