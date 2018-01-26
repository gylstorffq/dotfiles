#!/bin/bash
pandoc -s -t docx --data-dir=$1 $2 -o outputs/$(basename $2).docx
