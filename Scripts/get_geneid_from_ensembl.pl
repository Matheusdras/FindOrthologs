#!/usr/bin/perl
#@table
# #tax_id GeneID  Ensembl_gene_identifier RNA_nucleotide_accession.version        Ensembl_rna_identifier  protein_accession.version Ensembl_protein_identifier
# 7227    30970   FBgn0040373     NM_001297803.1  FBtr0340207     NP_001284732.1  FBpp0309182

#@ids
#707712
#15591
#274579

@table=`tail -n +2 $ARGV[0]`;
@ids=`cat $ARGV[1]`;
%hash;
foreach(@table){
    chomp;
    next if ($_ =~ /^#/);
    @split=split(/\t/,$_);
    if(($split[0] eq '9606')||($split[0] eq '10090')){
	$split[4] =~ s/\..+//;
	$hash{$split[4]}=$split[1];
    }
}
print "# ENSEMBL_ID\tGeneID\n";
foreach(@ids){
    chomp;
    print "$_\t$hash{$_}\n";
}
