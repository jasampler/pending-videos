#!/usr/bin/perl
use strict;
use warnings;

# Use: ls DIR | create-links.pl DIR >> links.html

my $dir = $ARGV[0];
if (defined($dir) && $dir ne '') {
	if ($dir !~ m/[\/]$/) {
		$dir .= '/';
	}
}
else {
	$dir = '';
}
my ($link, $text);
while (<STDIN>) {
	chomp;
	$text = $_;
	$link = $dir . $_;
	$link =~ s/ /%20/g;
	print '<a href="' . $link . '">' . $text . '</a><br/>' . "\n";
}
