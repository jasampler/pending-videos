#!/usr/bin/perl
use strict;
use warnings;

# update-videos.pl - Copyright 2018 Carlos Rica Espinosa
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details: http://www.gnu.org/licenses/
#
# Help and code for the program: http://github.com/jasampler/pending-videos
# -------------------------------------------------------------------------
#
# update-videos.pl gets a text file (TXT or HTML) as first parameter and writes
# to this text file the names of the new videos found in the given directories,
# also printing the FILES PENDING TO DELETE, which are the names of all existing
# videos marked with an "x" at the beginning of the line in the text file.
#
# Lines with videos in the file always begin with one character and a space.
# In HTML the names are placed inside a <span>...</span> tag after that space,
# allowing the user to change the style or adding more content before or after.
# The file can be edited to reorder, categorize and mark the videos as desired.
# Files found in the text file and not found in the directory are ignored,
# to use the program with different directories each time or move files around.

update_videos(@ARGV);

sub update_videos {
	@_ >= 2 || die "Missing parameters: TEXTFILE VIDEOSDIR1 ...";
	my $txtfile = shift @_;

	my %filesfromdir;
	foreach (@_) {
		read_directory($_, \%filesfromdir);
	}

	my $ishtml = is_html_by_filename($txtfile);
	my %filesfromtxt;
	open(TXTFILE, $txtfile) || die "Cannot open text file $txtfile: $!";
	while (<TXTFILE>) {
		parse_line($_, $ishtml, \%filesfromtxt);
	}
	close(TXTFILE);

	my (@filestoadd, @filestoremove);
	foreach (keys %filesfromdir) {
		find_file($_, \%filesfromtxt, \@filestoadd, \@filestoremove);
	}

	if (@filestoadd) {
		@filestoadd = sort @filestoadd;
		add_files($txtfile, $ishtml, \@filestoadd);
	}

	if (@filestoremove) {
		@filestoremove = sort @filestoremove;
		print "FILES PENDING TO DELETE:\n";
		foreach (@filestoremove) {
			print $_, "\n";
		}
	}
}

sub is_html_by_filename {
	my $filename = shift;
	if ($filename =~ m/.html?$/i) {
		return 1;
	}
	elsif ($filename =~ m/.txt$/i) {
		return 0;
	}
	die "Parameter must be an HTML or a TXT file!";
}

sub read_directory {
	my ($vidsdir, $rfilesfromdir) = @_;
	opendir(DIR, $vidsdir) || die "Cannot open directory $vidsdir: $!";
	while (readdir(DIR)) {
		if (! m/^\.\.?$/) {
			$$rfilesfromdir{$_} = 1;
		}
	}
	closedir(DIR);
}

sub parse_line {
	my ($line, $ishtml, $rfilesfromtxt) = @_;
	if ($line =~ s/^([^ ]) +//) { #if the line has a video:
		my $mark = $1;
		chomp $line;
		if ($ishtml) {
			$line =~ s/.*<span\b[^>]*>//;
			$line =~ s/<\/span>.*//;
		}
		$$rfilesfromtxt{$line} = $mark;
	}
}

sub find_file {
	my ($file, $rfilesfromtxt, $rfilestoadd, $rfilestoremove) = @_;
	my $mark = $$rfilesfromtxt{$file};
	if (defined $mark) { #if the video is in the text file:
		if ($mark eq 'x' || $mark eq 'X') {
			push @$rfilestoremove, $file;
		}
	}
	else {
		push @$rfilestoadd, $file;
	}
}

sub add_files {
	my ($txtfile, $ishtml, $rfilestoadd) = @_;
	open(TXTFILE, '>>', $txtfile)
		|| die "Cannot open text file $txtfile for appending: $!";
	foreach (@$rfilestoadd) {
		if ($ishtml) {
			print TXTFILE '- <span>', $_, '</span><br/>', "\n";
		}
		else {
			print TXTFILE '- ', $_, "\n";
		}
	}
	close(TXTFILE);
}

