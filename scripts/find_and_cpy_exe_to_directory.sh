#!/bin/bash
# simple script to find all executable without ending on Linux without relying on the executable flag.

rsync -Par `find -not -iname "*.*" -type f -exec file {} \; | grep executable | grep -o -P '(?<=\./).*(?=:)'` $1
