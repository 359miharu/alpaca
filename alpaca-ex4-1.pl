#!/usr/bin/perl
use strict;
use warnings;
use Data::Dumper;

# 引数としてハッシュリファレンスをもらうcheck_items_for_allサブルーチンを書く
# 動きはcheck_required_itemsの最終バージョン(テキスト掲載)と同じ
# 全ての乗客乗員が必須アイテムを持っているかどうか確認する。

#ハッシュを作成し、ハッシュリファレンスにしてサブルーチンに送る
my @gilligan = qw (red-shirt hat lucky_socks water_bottle);
my @skipper = qw (blue_shirt hat jacket preserver sunscreen);
my @professor =qw (sunscreen water_bottle slide_rules batteries radio);
my %all = (
    Gilligan  => \@gilligan,
    Skipper   => \@skipper,
    Professor => \@professor,
    );
check_items_for_all(\%all);

#サブルーチン
sub check_items_for_all {
    my $ref = shift;
    my @names = keys %$ref; #@name = Gligan,Skipper,Professor
    my @required = qw(preserver sunscreen water_bottle jacket);
    print "必須アイテムは@requiredです。\n";

    for my $who (@names) { # 人数分繰り返す
	my @items = @{$ref->{$who}}; # デリファレンスして配列に格納
	my @missing = ();

	for my $req_item (@required) { # foreachの意
	    push @missing, $req_item unless (grep $req_item eq $_, @items); # $_ = red-shirt,hat…
	    # 括弧の中は0か１の条件。0だったときの$req_itemを@missingに追加する
	}
	print "$whoは@missingを忘れています。\n" if (@missing);
    }
}
    
