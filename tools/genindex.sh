#!/bin/sh

echo "<html><head><title>index</title></head><body>"
echo "<h1> Auto Generate index : Vim Help(converted to HTML)</h1>"
echo "<ul>"
find . -name "*.html" -type f -exec echo "<li><a href=\"{}\">{}</a></li>" \;
echo "</ul>"
echo "</body></html>"
