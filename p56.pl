#!/usr/bin/env perl
use strict;
use warnings;
use Data::Dumper;

# 全島ネットワーク解析

my %total_bytes;
while (<DATA>) {
    my ($source, $destination,$bytes) = split;
    $total_bytes{$source}{$destination} += $bytes;
}
# 構造を理解したいとき
# warn Dumper \%total_bytes;


for my $source (sort keys %total_bytes) {
    for my $destination (sort keys %{$total_bytes{$source} }) {
	print "$source => $destination:",
	"$total_bytes{$source}{$destination} bytes\n";
    }
    print "\n";
}

__DATA__
pro gill 1250
pro love 910
thu love 1250
pro love 450
pro lase 2924
gin pro  1218
gin mary 199
