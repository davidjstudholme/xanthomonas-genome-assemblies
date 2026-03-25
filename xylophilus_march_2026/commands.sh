

trim_galore -q 30 --paired 12037_2217_S76_R1_001_fastp.fastq.gz 12037_2217_S76_R2_001_fastp.fastq.gz


#conda create -n hybracter_env python=3.11
conda activate hybracter_env
#conda install -c conda-forge -c bioconda hybracter

hybracter install

conda list -n hybracter_env > hybracter_env_packages.txt
conda env export > hybracter_env.yaml

hybracter hybrid -i hybracter.csv -o hybracter-hybrid -t 12







