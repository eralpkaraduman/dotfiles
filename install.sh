printf "git..."
ln -s -f ~/dotfiles/.gitconfig ~/.gitconfig
ln -s -f ~/dotfiles/.gitignore_global ~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global
echo "ok"

printf "tmux..."
ln -s -f ~/dotfiles/.tmux.conf ~/.tmux.conf
echo "ok"

printf "vim..."
ln -s -f ~/dotfiles/.vimrc ~/.vimrc
rm -rf ~/.vim_runtime
git clone --quiet https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh >/dev/null 2>/dev/null
echo "ok"

printf "zsh..."
rm -rf ~/.dracula-zsh-theme
git clone --quiet https://github.com/dracula/zsh.git ~/.dracula-zsh-theme
ln -s -f ~/.dracula-zsh-theme/dracula.zsh-theme ~/.oh-my-zsh/themes/dracula.zsh-theme
ln -s -f ~/dotfiles/.zshrc ~/.zshrc
echo "ok"

printf "vscode..."
ln -s -f ~/dotfiles/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
echo "ok"

echo "done."

/bin/zsh
