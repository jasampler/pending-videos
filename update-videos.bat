@ECHO OFF

REM Show videos which did not exist in last execution:
perl list-files.pl incoming |perl diff-sort.pl index-old.txt - |perl -ne "print if /^>/"

REM Add the links of those new videos to the index:
perl list-files.pl incoming |perl diff-sort.pl index-old.txt - |perl -ne "print if s/^> //" |perl create-links.pl incoming >>index.html

REM Save names of all current videos for the next execution:
perl -ne "print" index.html |perl -ne "if (/a href/) { s/^[-x] +//; s/<a[^>]*>//; s/<\/a>.*//; print; }" >index-old.txt

REM Save the names of all videos not marked:
perl -ne "print if /^[^-x]/" index.html |perl -ne "if (/a href/) { s/^[-x] +//; s/<a[^>]*>//; s/<\/a>.*//; print; }" >index-unmarked-old.txt

REM Show marked videos which can be deleted:
perl list-files.pl incoming |perl diff-sort.pl - index-unmarked-old.txt |perl -ne "print if /^</"

REM To show only deleted videos: perl list-files.pl incoming |perl diff-sort.pl index-old.txt - |perl -ne "print if /^</"
