#!/usr/bin/perl
use strict;
use warnings;

die "two arguments needed\n" if (@ARGV != 2);

my ($f1, $f2) = @ARGV;
die "only one standard input allowed\n" if ($f1 eq $f2 && $f1 eq '-');

my $lines1 = read_file($f1);
my $lines2 = read_file($f2);
my $map1 = get_map($lines1);
my $map2 = get_map($lines2);
for (@$lines1) {
	if (! exists $$map2{$_}) {
		print "< $_\n";
	}
}
for (@$lines2) {
	if (! exists $$map1{$_}) {
		print "> $_\n";
	}
}

sub get_map {
	my $lines = $_[0];
	my %map;
	chomp(@$lines);
	%map = map { $_ => 1 } @$lines;
	return \%map;
}

sub read_file {
	my $f = $_[0];
	my @f;
	if ($f eq '-') {
		@f = <STDIN>;
	} else {
		open(my $in,  "<",  $f)  or die "Can't open input.txt: $!";
		@f = <$in>;
	}
	return \@f;
}
