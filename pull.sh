#!/usr/bin/env bash

echo "Pulling repository"
git pull 

echo "Updating vim settings"
mkdir -p ~/.vim
cp .vimrc ~/.vimrc
chmod +w ~/.vim/coc-settings.json
cp .config/nvim/coc-settings.json ~/.vim/coc-settings.json
# Make readonly, so we remember to update coc-settings in nvim instead
chmod -w ~/.vim/coc-settings.json

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

echo "Updating obsidian config"
cp ~.obsidian.vimrc /Documents/Obsidian Vault/.obsidian.vimrc

echo "Updating images"
mkdir -p ~/.config/images
rsync -r .config/images ~/.config

echo "Updating ideavim config"
cp .ideavimrc ~/.ideavimrc

echo "Done"
