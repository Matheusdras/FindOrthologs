#!/usr/bin/perl
# #tax_id GeneID  relationship    Other_tax_id    Other_GeneID
# 7955    30037   Ortholog        7897    102366554
# 7955    30037   Ortholog        7994    103038481
# 7955    30037   Ortholog        7998    108255935
@table = `tail -n +2 $ARGV[0]`;
$c=0;
foreach(@table){
    chomp;
    @split=split(/\t/,$_);
    if(($split[0] eq '9606')&&($split[3] eq '10090')){
	print "$_\n";
	$c++;
    }
}

print "$c\n";
