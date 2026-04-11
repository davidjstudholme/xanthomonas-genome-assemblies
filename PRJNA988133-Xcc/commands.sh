./fastq-dump --gzip --split-files SRR25205310 SRR25205311 SRR25205314	
trim_galore -q 30 --paired SRR25205310_1.fastq.gz  SRR25205310_2.fastq.gz
trim_galore -q 30 --paired SRR25205311_1.fastq.gz  SRR25205311_2.fastq.gz
trim_galore -q 30 --paired SRR25205314_1.fastq.gz  SRR25205314_2.fastq.gz
#conda create -n unicycler_env
conda activate unicycler_env
#conda install bioconda::unicycler
conda list -n unicycler_env > unicycler_env_packages.txt
conda env export > unicycler_env.yaml
unicycler -1 SRR25205310_1_val_1.fq.gz -2 SRR25205310_2_val_2.fq.gz -o WHRI_3873.unicycler
unicycler -1 SRR25205311_1_val_1.fq.gz -2 SRR25205311_2_val_2.fq.gz -o WHRI_3851A.unicycler
unicycler -1 SRR25205314_1_val_1.fq.gz -2 SRR25205314_2_val_2.fq.gz -o WHRI_738C.unicycler

./fastq-dump --gzip --split-files SRR27397680 SRR25205263
./fastq-dump --gzip --split-files SRR27397677 SRR25183103
./fastq-dump --gzip --split-files SRR27397676 SRR25183094
./fastq-dump --gzip --split-files SRR27399090 SRR25183134
./fastq-dump --gzip --split-files SRR27397678 SRR25183137
./fastq-dump --gzip --split-files SRR27397679 SRR25205253

#conda create -n hybracter_env python=3.11
conda activate hybracter_env
#conda install -c conda-forge -c bioconda hybracter

hybracter install

conda list -n hybracter_env > hybracter_env_packages.txt
conda env export > hybracter_env.yaml

hybracter hybrid -i hybracter.csv -o hybracter-hybrid -t 12

#conda create -n unicycler_env                                                                                                                                           
conda activate unicycler_env
#conda install bioconda::unicycler                                                                                                                                       
conda list -n unicycler_env > unicycler_env_packages.txt
conda env export > unicycler_env.yaml

unicycler -1 SRR25183094_1_val_1.fq.gz -2 SRR25183094_2_val_2.fq.gz -l SRR27397676_1.fastq.gz -o WHRI_8978.unicycler

