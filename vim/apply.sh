#!/bin/bash

cp vim.vimrc ~/.vimrc
mkdir -p ~/.vim/spell && cp spell_en.utf-8.add ~/.vim/spell/en.utf-8.add
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
