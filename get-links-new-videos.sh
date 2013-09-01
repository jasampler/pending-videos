#!/bin/bash
./get-new-videos.sh |sed -e 's/^> //' |./create-links.pl incoming
