#!/usr/bin/perl
# >Hs.100003_vn.15_::_vn.10 [ENST00000428195][ENST00000459728]
# MLRKHVEFRKQKDIDNIISWQPPEVIQQYLSGGMCGYDLDGCPVWYDIIGPLDAKGLLFSASKQDLLRTKMRECELLLQECAHQTTKLGRKVETITIIYDCEGLGLKHLWKPAVEAYGEFLCMFEENYPETLKRLFVVKAPKLFPVAYNLIKPFLSEDTRKKIMVLGANWKEVLLKHISPDQVPVEYGGTMTDPDGNPKCKSKV
@fasta=`cat $ARGV[0]`;
@split = ();
$ids = "";
foreach(@fasta){
    chomp;
    if($_ =~ /^>.+ (\[.+)/){
	$ids = $1;
	$ids =~ s/\]\[/,/g;
	$ids =~ s/\]|\[//g;
	@split=split(/\,/,$ids);
    }else{
	foreach(@split){
	    print "$_\n";
	} 
    }
}
