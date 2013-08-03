#!/bin/sh

sudo cp -r .vim ${HOME}/
echo ".vim installed."
sudo cp .vimrc ${HOME}/
echo ".vimrc installed."
sudo cp MONACO.TTF ${HOME}/.fonts
sudo apt-get install exuberant-ctags
echo "Install successfully!"
