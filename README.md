pending-videos
==============

Utility for tracking videos stored in a directory and classifying them as pending watch, pending deletion or already seen.

How to use the program
----------------------

Unzip the files in a new directory and make in that directory a symbolic link named "incoming" linked to the directory where the videos are located (on Windows you need the command `mklink` with option `/j` to create a link that the program can use).

To update the list of the videos (the index.html file), you must open a terminal, change to the directory with the scripts and run the main script: ./update-videos.sh (on Windows: update-videos.bat)

To mark a video as pending deletion (-) or already seen (x), you must edit manually the file index.html and insert "- " or "x " at the beginning of the line with that video (the links in the index.html file can be reordered as desired, provided that the format of lines with videos is not changed).

In every update, the program will add at the end of the index.html file the new videos found and also it will report what files are pending deletion (marked videos not deleted yet).

Installation of Perl on Windows
-------------------------------

Download Strawberry Perl portable and uncompress it in a new folder in a path without spaces.
Following the instructions in the README, you should add the paths specified to the PATH environment variable.
To do that, open the Control Panel and search the word `path` to find the dialog for editing the
environment variables of the user. Then edit the PATH variable and insert the paths at the end of it, for example:
;C:\Users\MyName\bin\portable-perl\perl\site\bin;C:\Users\MyName\portable-perl\perl\bin;C:\Users\MyName\portable-perl\c\bin
Now you can open a console and run perl from any directory.
