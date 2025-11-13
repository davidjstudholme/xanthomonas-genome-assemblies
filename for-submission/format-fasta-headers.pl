#!/usr/bin/perl

use strict;
use warnings ;
use Bio::SeqIO ;

my $sequence_file = shift or die "Usage: $0 <sequence file>\n" ;

my $inseq = Bio::SeqIO->new('-file' => "<$sequence_file",
			    '-format' => 'fasta' ) ;

while (my $seq_obj = $inseq->next_seq ) {
  
    my $id = $seq_obj->id ;
    my $seq = $seq_obj->seq ;
    my $desc = $seq_obj->description ;

    if (length($seq) > 200) {
	
	if ($id =~ m/chromosome\d+/ and $desc =~ m/circular=true/) {
	    $desc = '[location=chromosome] [topology=circular] [completeness=complete]';
	    warn ">$id $desc\n";
	}

	if ($id =~ m/plasmid\d+/ and $desc =~ m/circular=true/) {
	    if ($desc =~ m/length=(\d+)/) {
		my $size = int( $1 / 10000 );
		$desc = "[plasmid-name=p$size] [topology=circular] [completeness=complete]";
		warn ">$id $desc\n";
	    }
	}
	
	$seq =~ s/\"//g;
	$seq =~ s/(\S{80})/$1\n/gi;
	$seq =~ s/\s+$//;
	
	print ">$id $desc\n$seq\n";;
    }
}

