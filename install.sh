#!/bin/sh

sudo pip install jedi

bundle_dir=~/.vim/bundle
if [ ! -d $bundle_dir ]; then
    mkdir -p $bundle_dir
    git clone https://github.com/gmarik/Vundle.vim.git $bundle_dir/Vundle.vim
fi

cp -r .vim/ftplugin ~/.vim/
cp .vimrc ~/

cp MONACO.TTF ~/.fonts

sudo apt-get install exuberant-ctags

vim +PluginInstall +PluginClean +qall
