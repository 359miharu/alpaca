#!/usr/bin/env perl
use strict;
use warnings;
use Data::Dumper;

# オライリー提供のlog_file.txtの内容を分類し、人物ごとのファイルに分ける
use IO::File;
open my $in_fh,'<', 'log.txt'
    or die "ファイルを開けませんでした\n";
my %hash;
while (<$in_fh>) {
    chomp;
    my $line = $_;
    my ($name, $fruits) = split(/:/,$line) ;
    $name = lc($name);
    push @{$hash{$name}} ,$line;  
}
#warn Dumper \%hash;
for (keys %hash) {
    my $name = $_ ;
    open my $out_fh,'>', "$_.txt"
	or die "ファイルを開けませんでした\n";
    for ( @{$hash{$name}} ) {
	print $out_fh "$_\n";
    }
}
