#!/bin/sh

tree -H . -T "Auto Generate index : Vim Help(converted to HTML)" --charset=UTF-8 --noreport -P "*.html" -I "index\.html|tags\.*html" --prune
