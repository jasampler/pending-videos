pending-videos
==============

Command-line utility for tracking videos stored in one or more directories and classifying them as pending watch, pending deletion or already seen.

How to use the program
----------------------

Download the file `update-videos.pl` and put it in a directory where you can find it later to run it. Then create the text file to use as the list of your videos, either HTML or TXT, for example `pending-videos.html`. You will have to edit this file, so if you don't know how to edit HTML files, then chose the TXT version, for example `pending-videos.txt`.

To run the program you need *Perl 5* installed (in Linux and Mac it comes by default, see below for Windows) and you must know the paths of the program `update-videos.pl`, the text file to use as the list of videos and the directory or directories where you store your videos. Then you must open a *terminal* (or *Command Prompt* in Windows). Suppose that the program, the text file and a subdirectory with videos are all in the same directory and you have changed with the command `cd` to that directory. Then, you can introduce, for example:

    perl  update-videos.pl  pending-videos.html  IncomingVideos

And the `update-videos.pl` program will write to that text file the names of the videos found in that directory, marked as *pending watch* with the symbol `-` at the beginning of each line with a video. To mark a video as *pending deletion* with the letter `x` or mark it using another character, you must edit the text file with a text editor and replace that character at the beginning of the line. You can reorder the lines or add titles and sections to the text file provided that the format of lines with videos is not changed.

In every run, the program will add at the end of the given text file the new videos found in each given directory and also it will report which files are pending deletion (videos marked with `x` and not deleted yet). You can preserve all deleted videos in the file to remember wich ones you watched before.

Installation of Perl on Windows
-------------------------------

Download *Strawberry Perl portable* and uncompress it in a new folder in a path without spaces.
Following the instructions in the README, you should add the paths specified to the PATH environment variable.
To do that, open the *Control Panel* and search the word `path` to find the dialog for editing the
environment variables of the user. Then edit the PATH variable and insert the paths at the end of it, for example:

    ;C:\Users\MyName\bin\portable-perl\perl\site\bin;C:\Users\MyName\portable-perl\perl\bin;C:\Users\MyName\portable-perl\c\bin

Now you can open a terminal and run perl from any directory.

