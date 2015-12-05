#!/bin/sh

#restart
rm incoming/*
echo "<html><body><h1>Pending videos</h1>" >index.html
echo -n > index-unmarked-old.txt
echo -n > index-old.txt

#add videos
echo -n > incoming/v2.mpg
./update-videos.sh
echo -n > incoming/v3.avi
./update-videos.sh
echo -n > incoming/v1.mkv
./update-videos.sh

#reorder videos
grep -v v2 index.html >TMP
grep v2 index.html >>TMP
cat TMP >index.html
./update-videos.sh

#remove videos
echo -n > incoming/v4.flv
./update-videos.sh
echo -n > incoming/v5.wmv
./update-videos.sh
rm incoming/v4.flv
./update-videos.sh
rm incoming/v2.mpg
./update-videos.sh

#mark videos to delete
grep -v v3 index.html >TMP
echo -n "x " >>TMP
grep v3 index.html >>TMP
cat TMP >index.html
#
grep -v v4 index.html >TMP
echo -n "x " >>TMP
grep v4 index.html >>TMP
cat TMP >index.html
#
./update-videos.sh
./update-videos.sh
rm incoming/v3.avi
./update-videos.sh

#clean
rm TMP

