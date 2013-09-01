#!/bin/bash
grep '^[^x-]' index.html |./grep-links.sh |sort
