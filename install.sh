#!/bin/sh

sudo pip install jedi

if [ ! -d ${HOME}/.vim/bundle ]; then
    mkdir -p ${HOME}/.vim/bundle
fi

git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

cp -r .vim/ftplugin ${HOME}/.vim/
cp .vimrc ${HOME}/

cp MONACO.TTF ${HOME}/.fonts

sudo apt-get install exuberant-ctags

vim +PluginInstall +qall
