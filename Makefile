.PHONY: all check replace html clean

VIM = vim
TARGET = $(FOLDER)

all:

check:
	nvcheck doc/*
	$(VIM) -eu tools/maketags.vim

replace:
	nvcheck -i doc/*

html:
	rm -rf $(TARGET)/
	mkdir -p $(TARGET)/generate
	cp doc/* $(TARGET)/generate
	cd $(TARGET)/generate; $(VIM) -eu ../../tools/buildhtml.vim -c "qall!"; cd -
	cp $(TARGET)/generate/*.html $(TARGET)/
	rm -rf $(TARGET)/generate
	cd $(TARGET);sh ../tools/genindex.sh > index.html; cd -

clean:
	rm -rf $(TARGET)
