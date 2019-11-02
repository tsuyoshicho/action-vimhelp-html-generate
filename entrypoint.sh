#!/bin/sh

VIM=vim
TARGET=$(FOLDER:-build)

# File Deploy
rm -rf $(TARGET)/
mkdir -p $(TARGET)/generate
cp doc/* $(TARGET)/generate
cd $(TARGET)/generate; $(VIM) -eu ../../tools/buildhtml.vim -c "qall!"; cd -
cp $(TARGET)/generate/*.html $(TARGET)/
rm -rf $(TARGET)/generate
cd $(TARGET);sh ../tools/genindex.sh > index.html; cd -

# EOF
