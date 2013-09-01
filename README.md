pending-videos
==============

Utility for tracking videos stored in a directory and classifying them as pending watch, pending deletion or already seen.

How to use the program
----------------------

Currently the program works only on Linux/UNIX, because it is composed of a few shell scripts using standard command-line tools like diff, grep, sed, sort, ls and perl.

Unzip or copy the files to a new directory and make in that directory a symbolic link named "incoming" linked to the directory where the videos are located.

To update the list of the videos (the index.html file), you must open a terminal, change to the directory with the scripts and run the main script: ./update-videos.sh

To mark a video as pending deletion (-) or already seen (x), you must edit manually the file index.html and insert "- " or "x " at the beginning of the line with that video (the links in the index.html file can be reordered as desired, provided that the format of lines with videos is not changed).

In every update, the program will add at the end of the index.html file the new videos found and also it will report what files are pending deletion (marked videos not deleted yet).

