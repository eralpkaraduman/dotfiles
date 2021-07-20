#!/usr/bin/env bash

echo "Installing vim-plug..."
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "Installing antigen..."
(cd $HOME && curl -L git.io/antigen > antigen.zsh)

echo "Installing fzf..."
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install

echo "Installing thefuck"
npm install --global pure-prompt

echo "Install pure (prompt)"
(cd $HOME && git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure")

echo "Install tmux"
apt install tmux
#brew install tmux

echo "Installing tpm..."
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "Open nvim and run \":PlugInstall\""
echo "Install bat https://github.com/sharkdp/bat#installation"
echo "Install zsh (sudo apt get install zsh)"
echo "Install fzf (https://github.com/junegunn/fzf#installation)"
echo "Install thefuck (https://github.com/nvbn/thefuck#installation)"
echo "Install ag (sudo apt install silversearcher-ag / brew install the_silver_searcher)"
echo "Install bat (https://github.com/sharkdp/bat#installation)"
