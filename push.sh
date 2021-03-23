#!/usr/bin/env bash

echo "Updating vim settings"
mkdir -p ./vim
cp ~/.vimrc ./vim
cp ~/.vim/coc-settings.json ./vim

mkdir -p ./nvim
cp ~/.config/nvim/init.vim ./nvim
cp ~/.config/nvim/coc-settings.json ./nvim

echo "Pushing to repository"
git add .
git clean -df
git commit -m "Update"
git push

echo "Done"
