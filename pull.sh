#!/usr/bin/env bash

echo "Pulling repository"
git add .
git clean -df
git commit -m "Update"
git push

echo "Updating vim settings"
mkdir -p ./vim
mkdir -p .config/nvim
cp ./vim/.vimrc ~/.vimrc
cp ./vim/coc-settings.json ~/.vim/coc-settings.json

echo "Updating zsh settings"
cp .zshrc ~/.zshrc

echo "Updating neovim settings"
mkdir -p ./config/nvim
cp ./nvim/init.vim ~/.config/nvim/init.vim          
cp ./nvim/coc-settings.json ~/.config/nvim/coc-settings.json 

echo "Updating tmux config"
cp .tmux.conf ~/.tmux.conf

echo "Updating kitty config"
mkdir -p ~/.config/kitty
cp ./.config/kitty/kitty.conf ~/.config/kitty/kitty.conf

echo "Update images"
rsync -r ~/.config/images .config/images

echo "Done"
