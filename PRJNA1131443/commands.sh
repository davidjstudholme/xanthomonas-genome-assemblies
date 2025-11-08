./fastq-dump --gzip --split-files SRR30035987 SRR29695112 SRR29695113


conda create -n hybracter_env python=3.11
conda activate hybracter_env
conda install -c conda-forge -c bioconda hybracter

hybracter install

conda list -n hybracter_env > hybracter_env_packages.txt
conda env export > hybracter_env.yaml

hybracter hybrid -i PRJNA1131443.csv -o PRJNA1131443.hybracter -t 12

  
  
