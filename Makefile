.PHONY: link plugins command-t

all: link plugins

link:
	ln -si $$(find $$PWD/src -depth 1 -type f) ~
	mkdir -p ~/.vim/colors
	ln -shi $$PWD/src/.vim/autoload ~/.vim/autoload
	ln -shi $$PWD/src/.vim/bundle ~/.vim/bundle
	ln -si $$(find $$PWD/src/.vim/colors -type f) ~/.vim/colors

plugins: command-t

command-t:
	cd ~/.vim/bundle/command-t && bundle install && rake make
