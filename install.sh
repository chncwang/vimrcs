#!/bin/sh

sudo pip install jedi

rm -rf ${HOME}/.vim && cp -r .vim ${HOME}/ && echo ".vim installed!" || \
    echo "Copy .vim failed!"

cp .vimrc ${HOME}/ && echo ".vimrc installed!" || \
    echo "Copy .vimrc failed!"

cp MONACO.TTF ${HOME}/.fonts && echo "install monaco succeeded!" || \
    echo "Install monaco failed!"

sudo apt-get install exuberant-ctags && echo "Install ctags successfully!" || \
    echo "Install ctags failed!"
