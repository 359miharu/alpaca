#!/usr/bin/env perl
use strict;
use warnings;
use Data::Dumper;

# 日付と曜日をファイル、スカラー、または両方に出力するプログラム
# 出力先はユーザーに選ばせる。
use IO::Tee;

my $date = (split / / ,localtime)[2];
my $yobi = (split / / ,localtime)[0];
my ($f_fh, $s_fh);

print "出力先を選んでください。";
print "f：ファイル  s：スカラー  w：両方  =>";
my $output = <>;
chomp $output;

if ($output eq 'f') {
    open $f_fh,'>>', 'date_yobi.txt'
	or die "ファイルを開けませんでした\n";
    print $f_fh "$date,$yobi\n";
} elsif ($output eq 's') {
    print "$date,$yobi\n";
} elsif ($output eq 'w') {    
    my $tee_fh = IO::Tee->new( $f_fh, $s_fh );
    print $tee_fh "$date,$yobi\n";
} else {
    print "入力が間違っています\n「f」「s」「w」のどれかひとつを入力してください\n";
}

#日付と時間の変数をつくる
#$f_fhと$s_fhをつくる
