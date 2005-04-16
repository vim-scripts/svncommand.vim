# $Id: Makefile 16 2005-04-17 04:10:07Z laz $

plugin/svncommand-autogenned.vim: plugin/cvscommand.vim
	./cvs2svn.sed < $< > $@

svncommand.diff: plugin/svncommand-autogenned.vim plugin/svncommand.vim
	diff -u $^ > $@ || true

final: plugin/svncommand.vim
diff: svncommand.diff
auto: plugin/svncommand-autogenned.vim

clean:
	rm -f plugin/svncommand-autogenned.vim svncommand.diff

.PHONY: clean
