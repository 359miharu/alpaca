#!/usr/bin/env perl
use strict;
use warnings;
use Data::Dumper;
use Cast;

my @array1 = 0..2;
my @array2 = ();
my @array3 = (0);
my @array4 = undef;
my @array5 = (undef);

print "array";
print @array1 ? "真":"偽";
print @array2 ? "真":"偽";
print @array3 ? "真":"偽";
print @array4 ? "真":"偽";
print @array5 ? "真":"偽";
print "\n";

my $scalar1 = '';
my $scalar2 = '0';
my $scalar3 = 0;
my $scalar4 = 0.0;
my $scalar5 = '0.0';
my $scalar6 = undef;

print "scalar";
print $scalar1 ? "真":"偽";
print $scalar2 ? "真":"偽";
print $scalar3 ? "真":"偽";
print $scalar4 ? "真":"偽";
print $scalar5 + 0 ? "真":"偽"; # どうしても数値として評価してほしいときは+0
print $scalar6 ? "真":"偽";
print "\n";
