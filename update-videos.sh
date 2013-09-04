#!/bin/sh

# Show videos which did not exist in last execution:
ls incoming |diff index-old.txt - |grep '^>'

# Add the links of those new videos to the index:
ls incoming |diff index-old.txt - |grep '^>' \
	|sed -e 's/^> //' |./create-links.pl incoming >>index.html

# Save names of all current videos for the next execution:
cat index.html |./grep-links.sh |sort >index-old.txt

# Save the names of all videos not marked:
grep '^[^x-]' index.html |./grep-links.sh |sort >index-unmarked-old.txt

# Show marked videos which can be deleted:
ls incoming |diff - index-unmarked-old.txt |grep '^<'

# To show only deleted videos: ls incoming |diff index-old.txt - |grep '^<'
