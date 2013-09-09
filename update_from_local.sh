#!/bin/bash

rm -rf .vim
cp -r ${HOME}/.vim . && echo ".vim updated." || echo "update .vim failed!"
cp ${HOME}/.vimrc . && echo ".vimrc updated." || echo "update .vimrc failed!"
