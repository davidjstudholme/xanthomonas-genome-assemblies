./fastq-dump --gzip --split-files SRR30037601 SRR30037602 SRR30037603 SRR30037604 SRR30037605 SRR30037606 SRR29655428 SRR29655429 SRR29655430 SRR29655431 SRR29655432 SRR29655433

#conda create -n hybracter_env python=3.11
conda activate hybracter_env
#conda install -c conda-forge -c bioconda hybracter

hybracter install

conda list -n hybracter_env > hybracter_env_packages.txt
conda env export > hybracter_env.yaml

hybracter hybrid -i PRJNA1130018.csv -o hybracter-hybrid -t 12

