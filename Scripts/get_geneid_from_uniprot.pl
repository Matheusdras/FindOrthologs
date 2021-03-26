#!/usr/bin/perl
#@table
# GeneID
#P31946  UniProtKB-ID    1433B_HUMAN
#    P31946  Gene_Name       YWHAB
#    P31946  GI      4507949
#    P31946  GI      377656702
#    P31946  GI      67464628
#    P31946  GI      1345590

#@ids
#A0A0C4DH62
#P22103
#A0A0A0MT87
#Q9UBB6

@table=`tail -n +2 $ARGV[0]`;
@ids=`cat $ARGV[1]`;
%hash;
foreach(@table){
    chomp;
    @split=split(/\t/,$_);
    if($split[1] eq 'GeneID'){
        $hash{$split[0]}=$split[2];
    }
}

print "#SwissprotID\tUniprotID\tGeneID\n";
foreach(@ids){
    chomp;
    @split=split(/\t/,$_);
    if(exists $hash{$split[1]}){
	print "$split[0]\t$split[1]\t$hash{$split[1]}\n";
    }else{
    	print "$split[0]\t$split[1]\tNA\n";
    }
}
