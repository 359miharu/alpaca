#!/usr/bin/env perl
use strict;
use warnings;
use Data::Dumper;

=before
・バージョン：p56.pl > alpaca-ex5-2_before.pl > alpaca-ex5-2.pl
・生成目的  ：p56を直接5-2に変身させるのは難しい。beforeを間に挟むことでステップを分ける。
・ステップ  ：p56   ->source=>destination=>bytesのリファレンスを作り表示する
            ：before->上記に加えて結果をdestination単位でbytesの大きい順に並べる
            ：5-2   ->上記に加えて結果にsource単位のbytes合計を表示する
     
(p56の結果)
 gin => mary:199 bytes
 gin => pro:1218 bytes
 
 pro => gill:1250 bytes
 pro => lase:2924 bytes
 pro => love:1360 bytes
 
 thu => love:1250 bytes

(beforeの結果)
gin => pro:1218 bytes
gin => mary:199 bytes

pro => lase:2924 bytes
pro => love:1360 bytes
pro => gill:1250 bytes

thu => love:1250 bytes

=cut


    my %total_bytes;
while (<DATA>) {
    my ($source, $destination,$bytes) = split;
    $total_bytes{$source}{$destination} += $bytes;
}

for my $source (sort keys %total_bytes) {
    for my $destination (sort { &by_bytes($source) } keys %{$total_bytes{$source} }) {
        print "$source => $destination:",
        "$total_bytes{$source}{$destination} bytes\n";
    }
    print "\n";
}


sub by_bytes {
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
