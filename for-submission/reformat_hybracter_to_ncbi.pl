#!/usr/bin/env perl

use strict;
use warnings;
use File::Spec;
use File::Basename qw(basename);
use Cwd qw(abs_path);

# Batch-convert Hybracter FASTA files to NCBI-friendly FASTA headers
# Parses Hybracter headers to detect:
#   - chromosome vs plasmid
#   - circular vs linear
#
# Usage:
#   perl hybracter_to_ncbi_batch.pl input_dir output_dir

# Optional per-file plasmid naming
# Key = input FASTA filename
# Value = arrayref of plasmid names in plasmid order
my %plasmid_names = (
    # 'NCPPB_552_final.fasta' => [ 'pNCPPB552_1' ],
);

my ($input_dir, $output_dir) = @ARGV;

die usage() unless defined $input_dir && defined $output_dir;
die "Input directory not found: $input_dir\n" unless -d $input_dir;

mkdir $output_dir unless -d $output_dir;
die "Could not create output directory: $output_dir\n" unless -d $output_dir;

$input_dir  = abs_path($input_dir);
$output_dir = abs_path($output_dir);

opendir(my $dh, $input_dir) or die "Cannot open directory $input_dir: $!";

my @fasta_files = sort grep {
    -f File::Spec->catfile($input_dir, $_) &&
    /\.(?:fa|fasta|fna)$/i
} readdir($dh);

closedir $dh;

die "No FASTA files found in $input_dir\n" unless @fasta_files;

for my $file (@fasta_files) {
    my $input_path  = File::Spec->catfile($input_dir,  $file);
    my $output_path = File::Spec->catfile($output_dir, output_name($file));

    my $sample_id = file_to_sample_id($file);
    my $names_ref = exists $plasmid_names{$file} ? $plasmid_names{$file} : [];

    process_fasta(
        input_fasta         => $input_path,
        output_fasta        => $output_path,
        sample_id           => $sample_id,
        known_plasmid_names => $names_ref,
    );

    print "Processed $file -> ", basename($output_path), "\n";
}

print "Done.\n";

sub process_fasta {
    my %args = @_;

    my $input_fasta  = $args{input_fasta};
    my $output_fasta = $args{output_fasta};
    my $sample_id    = $args{sample_id};

    my @known_plasmid_names = @{ $args{known_plasmid_names} || [] };

    my @records = read_fasta($input_fasta);
    die "No FASTA records found in $input_fasta\n" unless @records;

    open my $OUT, '>', $output_fasta or die "Cannot open $output_fasta: $!";

    my $plasmid_index    = 0;
    my $chromosome_seen  = 0;

    for my $rec (@records) {
        my $old_header = $rec->{header};
        my $sequence   = $rec->{seq};

        my $type     = infer_replicon_type($old_header);
        my $topology = infer_topology($old_header);

        my $new_header;

        if ($type eq 'chromosome') {
            die "Could not determine topology from chromosome header in $input_fasta:\n>$old_header\n"
                unless defined $topology;

            $chromosome_seen++;
            my $seqid = sanitize_seqid("${sample_id}_chr");

            $new_header = join ' ',
                ">$seqid",
                "[location=chromosome]",
                "[topology=$topology]",
                "[completeness=complete]";
        }
        elsif ($type eq 'plasmid') {
            unless (defined $topology) {
                warn "Skipping non-circular plasmid in $input_fasta:\n>$old_header\n";
                next;
            }

            $plasmid_index++;

            my $plasmid_name;
            if ($plasmid_index <= @known_plasmid_names) {
                $plasmid_name = sanitize_plasmid_name(
                    $known_plasmid_names[$plasmid_index - 1]
                );
            } else {
                $plasmid_name = "unnamed$plasmid_index";
            }

            my $seqid = sanitize_seqid("${sample_id}_p$plasmid_index");

            $new_header = join ' ',
                ">$seqid",
                "[plasmid-name=$plasmid_name]",
                "[topology=$topology]",
                "[completeness=complete]";
        }
        else {
            die "Could not determine replicon type from header in $input_fasta:\n>$old_header\n";
        }

        print {$OUT} $new_header, "\n";
        print {$OUT} wrap_seq($sequence, 80), "\n";
    }

    close $OUT;

    die "No chromosome record detected in $input_fasta\n" unless $chromosome_seen;
    die "Multiple chromosome records detected in $input_fasta\n" if $chromosome_seen > 1;
}







sub read_fasta {
    my ($path) = @_;

    open my $IN, '<', $path or die "Cannot open $path: $!";

    my @records;
    my ($header, $seq) = ('', '');

    while (my $line = <$IN>) {
        chomp $line;

        if ($line =~ /^>(.*)/) {
            if ($header ne '') {
                push @records, { header => $header, seq => $seq };
            }
            $header = $1;
            $seq    = '';
        }
        else {
            $line =~ s/\s+//g;
            $seq .= $line;
        }
    }

    push @records, { header => $header, seq => $seq } if $header ne '';
    close $IN;

    return @records;
}

sub infer_replicon_type {
    my ($header) = @_;

    return 'chromosome' if $header =~ /^chromosome\d*/i;
    return 'plasmid'    if $header =~ /^plasmid\d*/i;

    return undef;
}

sub infer_topology {
    my ($header) = @_;

    return 'circular' if $header =~ /\bcircular\s*=\s*true\b/i;
    return 'linear'   if $header =~ /\bcircular\s*=\s*false\b/i;

    return undef;
}


sub wrap_seq {
    my ($seq, $width) = @_;
    $width ||= 80;
    my @chunks = ($seq =~ /.{1,$width}/g);
    return join("\n", @chunks);
}

sub sanitize_seqid {
    my ($text) = @_;
    $text =~ s/[^A-Za-z0-9._-]+/_/g;
    $text =~ s/^_+//;
    $text =~ s/_+$//;
    return $text;
}

sub sanitize_plasmid_name {
    my ($name) = @_;
    $name =~ s/[^A-Za-z0-9._]+/_/g;
    $name = substr($name, 0, 20);
    return $name;
}

sub file_to_sample_id {
    my ($file) = @_;
    $file =~ s/\.(?:fa|fasta|fna)$//i;
    return sanitize_seqid($file);
}

sub output_name {
    my ($file) = @_;
    $file =~ s/\.(?:fa|fasta|fna)$//i;
    return $file . ".ncbi.fasta";
}

sub usage {
    return <<"USAGE";
Usage:
  perl hybracter_to_ncbi_batch.pl input_dir output_dir

Example:
  perl hybracter_to_ncbi_batch.pl hybracter_fastas ncbi_fastas
USAGE
}


