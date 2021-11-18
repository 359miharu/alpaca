#!/usr/bin/perl
use strict;
use warnings;
use Data::Dumper;

# 1.コマンドラインからファイル名のリストを受け取る
# 2.grepを使って1000バイト未満のファイルを選択する
# 3.mapでリスト内の文字列の先頭に4文字分のスペースを追加し、文字列の後に改行を付加する
# 4.得られたリストを表示する

print "ファイル名のリスト：";
my @grep = grep &pickup($_,), @ARGV;
my @map = map {"    $_\n"} @grep;
print @map;

sub pickup {
    my $file = shift;
    my $size = -s($file);
    return $size if $size < 1000;
}
