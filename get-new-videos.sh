#!/bin/bash
ls incoming |diff index-old.txt - |grep '^>'
#./get-links-new-videos.sh >>index.html #after!
#./get-names-videos.sh >index-old.txt #after!
