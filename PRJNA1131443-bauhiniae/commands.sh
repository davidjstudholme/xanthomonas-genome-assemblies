./fastq-dump --gzip --split-files SRR30035987 SRR29695112 SRR29695113

trim_galore -q 30 --paired SRR29695112_1.fastq.gz SRR29695112_2.fastq.gz 

conda create -n hybracter_env python=3.11
conda activate hybracter_env
conda install -c conda-forge -c bioconda hybracter

hybracter install

conda list -n hybracter_env > hybracter_env_packages.txt
conda env export > hybracter_env.yaml

hybracter hybrid -i PRJNA1131443.csv -o PRJNA1131443.hybracter -t 12


conda activate unicycler_env
conda create -n unicycler_env
conda activate unicycler_env
conda install bioconda::unicycler

conda list -n unicycler_env > unicycler_env_packages.txt
conda env export > unicycler_env.yaml


unicycler -1 SRR29695112_1_val_1.fq.gz -2 SRR29695112_2_val_2.fq.gz -o NCPPB1629.unicycler



  
