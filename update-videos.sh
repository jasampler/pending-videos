#!/bin/sh
./get-new-videos.sh #show videos which did not exist in last execution
./get-links-new-videos.sh >>index.html #add those to index
./get-names-videos.sh >index-old.txt #save all
./get-names-videos-unmarked.sh >index-unmarked-old.txt #save not marked
./show-deletable-videos.sh #show marked videos which can be deleted
#./show-deleted-videos.sh
