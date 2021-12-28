#!/usr/bin/env perl
use strict;
use warnings;
use Data::Dumper;

# コマンドラインで複数のディレクトリを受け付けて、その内容を表示する
use IO::Dir;

print "ディレクトリ名を入力（複数可、区切りは改行）：\n";
my @dir = <>;


for (@dir) {
    chomp;
    
}


=a
my $dir_fh = IO::Dir->new( '.' )
    or die "ディレクトリハンドルを開けませんでした\n";
while ( defind(my $file = $dir_fh -> read )) {
    print "a";
}

 
