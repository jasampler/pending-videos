#!/bin/bash
#./get-names-videos.sh >index-old.txt #before!
ls incoming |diff index-old.txt - |grep '^<'
