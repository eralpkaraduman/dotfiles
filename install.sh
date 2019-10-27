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
mkdir -p ~/.vim/colors/
curl https://raw.githubusercontent.com/erichdongubler/vim-sublime-monokai/master/colors/sublimemonokai.vim > ~/.vim/colors/sublimemonokai.vim
git clone --quiet https://github.com/amix/vimrc.git ~/.vim_runtime
ln -s -f ~/dotfiles/my_configs.vim ~/.vim_runtime/my_configs.vim
chmod +x ~/.vim_runtime/install_awesome_vimrc.sh
~/.vim_runtime/install_awesome_vimrc.sh
ln -s -f ~/dotfiles/.vimrc ~/.vimrc
echo "ok"

printf "vim dart plugin..."
git clone git://github.com/dart-lang/dart-vim-plugin.git ~/.vim_runtime/my_plugins/dart-vim-plugin
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

echo "install input front by going to this url:"
echo "https://input.fontbureau.com/build/?fontSelection=whole&a=0&g=ss&i=serifs_round&l=serifs_round&zero=slash&asterisk=0&braces=0&preset=default&line-height=1.3&accept=I+do&email="

printf "vscode..."
ln -s -f ~/dotfiles/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
~/dotfiles/vscode/install_extensions.sh
echo "ok"

printf "iTerm2..."
curl -L https://iterm2.com/shell_integration/install_shell_integration_and_utilities.sh | bash
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "$HOME/dotfiles/iTerm2"
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true
echo "ok"

printf "Xcode..."
# Based on https://github.com/halcyonmobile/xcode-monokai-revisited
mkdir -p ~/Library/Developer/Xcode/UserData/FontAndColorThemes
ln -s -f ~/dotfiles/Xcode/Monokai\ Revisited\ Custom.xccolortheme ~/Library/Developer/Xcode/UserData/FontAndColorThemes/Monokai\ Revisited\ Custom.xccolortheme
echo "ok"

echo "done."

/bin/zsh
