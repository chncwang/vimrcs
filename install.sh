#!/bin/sh

sudo pip install jedi

bundle_dir=~/.vim/bundle
if [ ! -d $bundle_dir ]; then
    mkdir -p $bundle_dir
    git clone https://github.com/gmarik/Vundle.vim.git $bundle_dir/Vundle.vim
fi

cp -r .vim/ftplugin ~/.vim/
cp .vimrc ~/

os=`uname`

if [ $os != 'Darwin' ]; then
    cp MONACO.TTF ~/.fonts
    sudo apt-get install exuberant-ctags
else
    brew install ctags-exuberant
fi

if [ ! -d $HOME/.vim/bundle/Vundle.vim ]; then
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

vim +PluginInstall +PluginClean +qall
