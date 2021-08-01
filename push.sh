#!/usr/bin/env bash

echo "Updating vim settings"
cp ~/.vimrc ./vimrc

echo "Updating neovim settings"
cp ~/.config/nvim/init.vim .config/nvim/init.vim
cp ~/.config/nvim/coc-settings.json .config/nvim/coc-settings.json

echo "Updating zsh settings"
cp ~/.zshrc .

echo "Updating tmux config"
cp ~/.tmux.conf .

echo "Updating kitty config a"
cp ~/.config/kitty/kitty.conf .config/kitty/kitty.conf

echo "Update images"
rsync -r ~/.config/images .config/

echo "Pushing to repository"
git add .
git clean -df
git commit -m "Update"
git push


echo "Done"
