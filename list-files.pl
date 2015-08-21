#!/usr/bin/perl
use strict;
use warnings;

foreach (@ARGV) {
	my $d = $_;
	if (opendir(DIR, $d)) {
		while (readdir(DIR)) {
			print $_, "\n" if (! /^\.\.*$/);
		}
		closedir(DIR);
	}
}
