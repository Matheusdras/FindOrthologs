perl get_ensemblid_from_fasta.pl ../Databases/Hs.tr_release100.fasta > ../Results/Hs.ensembl
perl get_ensemblid_from_fasta.pl ../Databases/Mm.tr_release100.fasta > ../Results/Mm.ensembl
perl get_uniprotid_from_fasta.pl ../Databases/swissprot_Homo_sapiens_22_12_20.fasta > ../Results/Swissprot_Hs.ids
perl get_uniprotid_from_fasta.pl ../Databases/swissprot_Mus_musculus_22_12_20.fasta > ../Results/Swissprot_Mm.ids
perl get_geneid_from_ensembl.pl ../Tables/gene2ensembl_2021-01-06 ../Results/Hs.ensembl > ../Results/Hs.ensembl.geneid
perl get_geneid_from_ensembl.pl ../Tables/gene2ensembl_2021-01-06 ../Results/Mm.ensembl > ../Results/Mm.ensembl.geneid
perl get_geneid_from_uniprot.pl ../Tables/HUMAN_9606_idmapping_02-12-2020.dat ../Results/Swissprot_Hs.ids \
     > ../Results/Swissprot_Hs.ids.geneids
perl get_geneid_from_uniprot.pl ../Tables/MOUSE_10090_idmapping_02-12-2020.dat ../Results/Swissprot_Mm.ids \
     > ../Results/Swissprot_Mm.ids.geneids
perl simple_orthologs.pl ../Tables/gene_orthologs_2021-01-06 > ../Tables/Human_Mouse_gene_orthologs.txt
perl find_orthologs.pl ../Tables/Human_Mouse_gene_orthologs.txt ../Results/Swissprot_Hs.ids.geneids \
     ../Results/Hs.ensembl.geneid ../Results/Swissprot_Mm.ids.geneids ../Results/Mm.ensembl.geneid > ../Results/Orthologs.txt
