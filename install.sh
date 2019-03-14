printf "bash profile..."
ln -s -f ~/dotfiles/.bash_profile ~/.bash_profile

printf "git..."
ln -s -f ~/dotfiles/.gitconfig ~/.gitconfig
ln -s -f ~/dotfiles/.gitignore_global ~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global
echo "ok"

printf "tmux..."
ln -s -f ~/dotfiles/.tmux.conf ~/.tmux.conf
echo "ok"

printf "vim..."
rm -rf ~/.vim_runtime
git clone --quiet https://github.com/amix/vimrc.git ~/.vim_runtime
ln -s -f ~/dotfiles/my_configs.vim ~/.vim_runtime/my_configs.vim
sh ~/.vim_runtime/install_awesome_vimrc.sh >/dev/null 2>/dev/null
ln -s -f ~/dotfiles/.vimrc ~/.vimrc
echo "ok"

printf "zsh..."
rm -rf ~/.dracula-zsh-theme
git clone --quiet https://github.com/dracula/zsh.git ~/.dracula-zsh-theme
ln -s -f ~/.dracula-zsh-theme/dracula.zsh-theme ~/.oh-my-zsh/themes/dracula.zsh-theme
ln -s -f ~/dotfiles/.zshrc ~/.zshrc
echo "ok"

printf "fira code font..."
brew tap caskroom/fonts
brew cask install font-fira-code
echo "ok"

printf "vscode..."
ln -s -f ~/dotfiles/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
~/dotfiles/vscode/install_extensions.sh
echo "ok"

printf "iTerm2..."
curl -L https://iterm2.com/shell_integration/zsh \
-o ~/.iterm2_shell_integration.zsh
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "$HOME/dotfiles/iTerm2"
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true
echo "ok"

echo "done."

/bin/zsh
