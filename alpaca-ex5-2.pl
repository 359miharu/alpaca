#!/usr/bin/env perl
use strict;
use warnings;
use Data::Dumper;

# 本章のコードを書き換え、出力の各ソースマシンの部分でそのマシンが転送したバイトの
# 合計が表示されるようにする。ソースマシンは転送データの多い物から順に並べ、ソース
# マシングループ内のデステネーションマシンはソースマシンからの転送量が多い順に並べる。
# 出力は、最も多くのデータを送ったソースマシンがリストの先頭に並び、そのソースから
# 最も多くのデータを受け取ったデスティネーションがその中の先頭に並ぶようにする。

=sample
pro 2924+1360+1250
pro => lase:2924 bytes
pro => love:1360 bytes
pro => gill:1250 bytes

gin => pro:1218 bytes
gin => mary:199 bytes

thu => love:1250 bytes
=cut

my %total_bytes;
my %source_bytes;
while (<DATA>) {
    my ($source, $destination,$bytes) = split;
    $total_bytes{$source}{$destination} += $bytes;
    $source_bytes{$source} += $bytes;
    # $source_bytes{$source} = $source_bytes{$source}（=1250）+$bytes;
}


for my $src (sort { &by_src } keys %source_bytes) {
    print "$src:$source_bytes{$src} bytes\n";
    for my $dest (sort { &by_dest($src) } keys %{$total_bytes{$src} }) {
        print "$src => $dest:",
        "$total_bytes{$src}{$dest} bytes\n";
    }
    print "\n";
}

sub by_src{
    $source_bytes{$b} <=> $source_bytes{$a}
}

sub by_dest { 
    my $s = shift;
    $total_bytes{$s}{$b} <=> $total_bytes{$s}{$a}
}

__DATA__
pro gill 1250
pro love 910
thu love 1250
pro love 450
pro lase 2924
gin pro  1218
gin mary 199
