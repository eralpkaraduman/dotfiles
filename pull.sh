#!/usr/bin/env bash

echo "Pulling repository"
git add .
git clean -df
git commit -m "Update"
git push

echo "Updating vim settings"
mkdir -p ./vim
cp ./vim/.vimrc ~/.vimrc
cp ./vim/coc-settings.json ~/.vim/coc-settings.json

echo "Updating neovim settings"
mkdir -p ./nvim
cp ./nvim/init.vim ~/.config/nvim/init.vim          
cp ./nvim/coc-settings.json ~/.config/nvim/coc-settings.json 

echo "Done"
