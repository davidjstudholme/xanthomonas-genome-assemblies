./fastq-dump --gzip --split-files SRR29654663 SRR29654664 SRR29654665 SRR29654666 SRR29654667 SRR29654668 SRR29654669 SRR29654670 SRR29654671 SRR30041326 SRR30041327 SRR30041328 SRR30041329 SRR30041330 SRR30041331 SRR30041332 SRR30041333 

trim_galore -q 30 --paired SRR29654667_1.fastq.gz SRR29654667_2.fastq.gz
trim_galore -q 30 --paired SRR29654663_1.fastq.gz SRR29654663_2.fastq.gz

#conda create -n hybracter_env python=3.11
conda activate hybracter_env
#conda install -c conda-forge -c bioconda hybracter

hybracter install

conda list -n hybracter_env > hybracter_env_packages.txt
conda env export > hybracter_env.yaml

hybracter hybrid -i ricini.csv -o hybracter-hybrid -t 12

#conda create -n unicycler_env
conda activate unicycler_env
#conda install bioconda::unicycler

conda list -n unicycler_env > unicycler_env_packages.txt
conda env export > unicycler_env.yaml

unicycler -1 SRR29654667_1_val_1.fq.gz -2 SRR29654667_2_val_2.fq.gz -o NCPPB_1324.unicycler

unicycler -1 SRR29654663_1.fastq.gz -2 SRR29654663_2.fastq.gz -l SRR30041332_1.fastq.gz -o NCPPB_113.unfiltered.unicycler
unicycler -1 SRR29654663_1_val_1.fq.gz -2 SRR29654663_2_val_2.fq.gz -l SRR30041332_1.fastq.gz -o NCPPB_113.unicycler
