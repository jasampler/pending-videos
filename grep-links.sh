#!/bin/bash
grep 'a href' |sed -e 's/^[-x] //' -e 's/<a[^>]*>//' -e 's/<\/a>.*//'
