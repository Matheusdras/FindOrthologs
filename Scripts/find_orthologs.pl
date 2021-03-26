#!/usr/bin/perl
#tax_id GeneID  relationship    Other_tax_id    Other_GeneID
#9606    1       Ortholog        10090   117586
#9606    9       Ortholog        10090   17960
@table = `tail -n +2 $ARGV[0] | cut -f2,5`;
@human_uniprot = `tail -n +2 $ARGV[1]`;
@human_splice = `tail -n +2 $ARGV[2]`;
@mouse_uniprot = `tail -n +2 $ARGV[3]`;
@mouse_splice = `tail -n +2 $ARGV[4]`;
%human;
%mouse;

foreach(@human_uniprot){
    chomp;
    ($swiss,$uni,$gene)=split(/\t/,$_);
    $human{$gene}{$swiss}++;
}

foreach(@mouse_uniprot){
    chomp;
    ($swiss,$uni,$gene)=split(/\t/,$_);
    $mouse{$gene}{$swiss}++;
}

foreach(@human_splice){
    chomp;
    ($uni,$gene)=split(/\t/,$_);
    $human{$gene}{$uni}++;
}

foreach(@mouse_splice){
    chomp;
    ($uni,$gene)=split(/\t/,$_);
    $mouse{$gene}{$uni}++;
}
print "# Human_geneid\tHuman_ids\tMouse_geneid\tMouse_ids\n";
foreach(@table){
    chomp;
    ($id1,$id2)=split(/\t/,$_);
    if(($human{$id1})&&($mouse{$id2})){
	$cd = "";
	print "$id1\t";
	foreach $code (keys %{$human{$id1}}){
	    $cd .= "$code,";
	}
	$cd =~ s/,$//;
	$cd =~ s/^,//;
	print "$cd\t";
	$cd = "";
	print "$id2\t";
	foreach $code (keys %{$mouse{$id2}}){
	    $cd .= "$code,";
	}
	$cd =~ s/,$//;
	$cd =~ s/^,//;
	print "$cd\n";
    }
}
