#!/usr/bin/env bash

echo "Updating vim settings"
cp ~/.vimrc .
cp ~/.vim/coc-settings.json .
cp ~/.config/nvim/init.vim .
cp ~/.config/nvim/coc-settings.json

echo "Pushing to repository"
git add .
git clean -df
git commit -m "Update"
git push

echo "Done"
