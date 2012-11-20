.PHONY: link plugins command-t

all: submodules link plugins

submodules:
	git submodule update --init

link: submodules
	find $$PWD/src -maxdepth 1 -type f -exec ln -is '{}' ~ \;
	mkdir -p ~/.vim
	find $$PWD/src/.vim -maxdepth 1 -type d -exec ln -is '{}' ~/.vim \;

plugins: command-t

command-t: submodules
	cd ~/.vim/bundle/command-t && bundle install && rake make
