wget https://github.com/enasequence/webin-cli/releases/download/9.0.1/webin-cli-9.0.1.jar
java -jar webin-cli-9.0.1.jar  --help

for i in NCPPB2856.unicycler NCPPB_2998.unicycler NCPPB2864.unicycler NCPPB_3204.unfiltered.unicycler NCPPB3959.unicycler NCPPB_3204.unicycler NCPPB_113.unicycler NCPPB1629.unicycler NCPPB_1324.unfiltered.unicycler NCPPB_485.unfiltered.unicycler NCPPB_1324.unicycler NCPPB_485.unicycler NCPPB_478.unicycler NCPPB_2063.unfiltered.unicycler NCPPB_1827.unicycler NCPPB_2063.unicycler NCPPB_2060.unicycler NCPPB_573.unfiltered.unicycler NCPPB_2914.unicycler NCPPB_573.unicycler NCPPB_2494.unfiltered.unicycler  NCPPB_536.unicycler  NCPPB_536.unfiltered.unicycler NCPPB_2494.unicycler NCPPB_646.unfiltered.unicycler  NCPPB_646.unicycler NCPPB_2997.unfiltered.unicycler WHRI_3851A.unicycler NCPPB_2997.unicycler WHRI_3873.unicycler NCPPB_2998.unfiltered.unicycler WHRI_738C.unicycler; do ln -s   ../*/$i/assembly.fasta ./$i.fasta; done

ln -s ../*/hybracter-*/FINAL_OUTPUT/complete/*final.fasta .

ln -s ../*/hybracter-*/FINAL_OUTPUT/*complete/*final.fasta .



779  conda create -n bioperl_env
  780  conda activate bioperl_env
  781  conda install bioperl
  782  conda install bioconda::bioperl
  783  conda install bioconda::perl-bioperl


  for i in *final.fasta; do perl format-fasta-headers.pl $i > reformatted.$i; done


  

  

