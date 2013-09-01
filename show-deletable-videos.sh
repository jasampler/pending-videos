#!/bin/bash
#./get-names-videos-unmarked.sh >index-unmarked-old.txt #before!
ls incoming |diff - index-unmarked-old.txt |grep '^<'
