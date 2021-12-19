#!/usr/bin/env bash

echo "Install nvm https://github.com/nvm-sh/nvm"
echo "Install node"
echo "Install zsh (sudo apt install zsh)"
echo "Install tldr"
echo "Install ag (sudo apt install silversearcher-ag / brew install the_silver_searcher)"
echo "Install bat (https://github.com/sharkdp/bat#installation)"
echo "Set alfred preferences folder to folder here"
echo "Set mac keyboard layout to ABC"
echo "Installing vim-plug..."

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "Set zsh as default shell"

echo "Installing antigen..."
(cd $HOME && curl -L git.io/antigen > antigen.zsh)

echo "Installing fzf..."
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install

#npm install --global pure-prompt

echo "Install pure (prompt) (try starship maybe?)"
(cd $HOME && git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure")

echo "Install tmux"
sudo apt install tmux
#brew install tmux

echo "Installing tpm..."
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "Open nvim and run \":PlugInstall\""

echo "Install xclip"
sudo apt install xclip

# Set key repeat speed faster than maximum on match
# defaults write -g InitialKeyRepeat -int 1634073490000
# defaults write -g KeyRepeat -int 1

# Disable press and hold for special characters on mac
# defaults write -g ApplePressAndHoldEnabled -bool false 

echo "Install pip (required by nvim snippets)"
sudo apt install python3-pip


echo "Install pynvim (required by nvim snippets)"
python3 -m pip install --user --upgrade pynvim

