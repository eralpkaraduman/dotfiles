#!/usr/bin/env bash

echo "Pulling repository"
git pull 

echo "Updating vim settings"
mkdir -p ~/.vim
cp ./vim/.vimrc ~/.vimrc
cp .config/nvim/coc-settings.json ~/.vim/coc-settings.json
# Make readonly, so we remember to update coc-settings in nvim instead
chmod 0444 ~/.vim/coc-settings.json

echo "Updating zsh settings"
cp .zshrc ~/.zshrc

echo "Updating neovim settings"
mkdir -p ~/.config/nvim
cp .config/nvim/init.vim ~/.config/nvim/init.vim          
cp .config/nvim/coc-settings.json ~/.config/nvim/coc-settings.json 

echo "Updating tmux config"
cp .tmux.conf ~/.tmux.conf

echo "Updating kitty config"
mkdir -p ~/.config/kitty
cp ./.config/kitty/kitty.conf ~/.config/kitty/kitty.conf

echo "Update images"
mkdir -p ~/.config/images
rsync -r .config/images ~/.config

echo "Done"
