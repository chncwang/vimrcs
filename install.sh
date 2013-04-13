#!/bin/sh

sudo cp -r .vim ${HOME}/
echo ".vim installed."
sudo cp .vimrc ${HOME}/
echo ".vimrc installed."
sudo cp MONACO.TTF ${HOME}/.fonts
echo "Install successfully!"
