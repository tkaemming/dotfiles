.PHONY: link

link:
	ln -si $$(find $$PWD/src -depth 1 -type f) ~
	mkdir -p ~/.vim/colors
	ln -si $$PWD/src/.vim/autoload ~/.vim/autoload
	ln -si $$(find $$PWD/src/.vim/colors -type f) ~/.vim/colors
