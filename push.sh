#!/usr/bin/env bash

echo "Updating vim settings"
cp ~/.vimrc .vimrc

echo "Updating neovim settings"
cp ~/.config/nvim/init.vim .config/nvim/init.vim
cp ~/.config/nvim/coc-settings.json .config/nvim/coc-settings.json

echo "Updating zsh settings"
cp ~/.zshrc .

echo "Updating tmux config"
cp ~/.tmux.conf .

echo "Updating kitty config"
cp ~/.config/kitty/kitty.conf .config/kitty/kitty.conf

echo "Update images"
rsync -r ~/.config/images .config/

echo "Updating ideavim config"
cp ~/.ideavimrc .

echo "Updating obsidian config"
cp ~/Documents/Obsidian\ Vault/obsidian.vimrc .

echo "Updating alacritty config"
cp ~/.config/alacritty/alacritty.yml .config/alacritty/alacritty.yaml

echo "Updating wezterm config"
cp ~/.config/wezterm/wezterm.lua .config/wezterm/wezterm.lua

echo "Updating ghostty config"
cp $HOME/Library/Application\ Support/com.mitchellh.ghostty/config .config/ghostty/config

echo "Pushing to repository"
git diff --exit-code | bat
git add .
git clean -df
git commit -m "Update"
git push


echo "Done"
