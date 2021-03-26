#!/usr/bin/perl
#>sp|Q9UBB6-3|NCDN_HUMAN Isoform 3 of Neurochondrin OS=Homo sapiens OX=9606 GN=NCDN
@fasta=`cat $ARGV[0]`;
foreach(@fasta){
    chomp;
    if($_ =~ /^>/){
	if($_ =~ /===/){
	    @unis=split(/===/,$_);
	    foreach(@unis){
		&print_swissprot_code($_);
	    }
	}else{
	    &print_swissprot_code($_);
	}
    }
}

sub print_swissprot_code{
    $i = $_[0];
    $i =~ /sp\|(.+)\|/;
    $i = $1;
    if($i =~ /\-/){
	@split=split(/\-/, $i);
	print "$i\t$split[0]\n";
    }else{
	print "$i\t$i\n";
    }
}
