# Based on this guide: https://www.viget.com/articles/zsh-config-productivity-plugins-for-mac-oss-default-shell/

export PATH="/usr/local/bin:$PATH"

# History
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zsh_history"

HISTSIZE=50000
SAVEHIST=10000
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt inc_append_history
setopt share_history

# Changing directories
setopt auto_cd
setopt auto_pushd
unsetopt pushd_ignore_dups
setopt pushdminus

# Completion
#setopt auto_menu
#setopt always_to_end
#setopt complete_in_word
#unsetopt flow_control
#unsetopt menu_complete
#zstyle ':completion:*:*:*:*:*' menu select
#zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|=*' 'l:|=* r:|=*'
#zstyle ':completion::complete:*' use-cache 1
#zstyle ':completion::complete:*' cache-path ':completion:*' list-colors ''
#zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'


# Other
setopt prompt_subst

# Visual Studio Code
export REACT_EDITOR=nvim

# sudoedit editor
export SUDO_EDITOR="nvim"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completionsource ~/.zsh_plugins.sh

# Antigen
# install antigen https://github.com/zsh-users/antigen
source ~/antigen.zsh
antigen use oh-my-zsh
antigen bundle git
#antigen bundle pip
antigen bundle osx
antigen bundle fzf
antigen bundle node
antigen bundle yarn
#antigen bundle vi-mode
#antigen bundle virtualenv
#antigen bundle iterm2
#antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle command-not-found
#antigen bundle mafredri/zsh-async
#antigen bundle lukechilds/zsh-better-npm-completion
antigen bundle Aloxaf/fzf-tab
antigen apply

# Pure Prompt theme
ZSH_THEME="" #Disalbe oh-my-zsh themes
# Install pure prompt manually npm install --global pure-prompt
# Based on https://nicedoc.io/sindresorhus/pure#example
fpath+=$HOME/.zsh/pure
autoload -U promptinit; promptinit
PURE_CMD_MAX_EXEC_TIME=10
zstyle :prompt:pure:path color gray
zstyle ':prompt:pure:prompt:*' color cyan
zstyle :prompt:pure:git:stash show yes
prompt pure

# # Java
# export PATH="$HOME/.jenv/bin:$PATH"
# eval "$(jenv init -)"

# Flutter (Overriden by HH Flutter in .zshrc-private)
# export PATH="$PATH:$HOME/flutter/bin"

# Python
export PATH="$PATH:/Users/eralpkaraduman/Library/Python/3.8/bin"

# LOVE2D
export PATH=$PATH:/Applications/love.app/Contents/MacOS/

source ~/.zshrc-private

export PATH=$PATH:$HOME/tools/bin
export PATH=$PATH:$HOME/bin

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if [ "$(uname 2> /dev/null)" = "Linux" ]; then
  # Map caps lock to escape
  setxkbmap -option caps:escape
  
  # Map super key (windows) to ctrl
  setxkbmap -option altwin:ctrl_win
  
  export PATH=$PATH:~/.local/bin
fi

[[ -s "/home/eralp/.gvm/scripts/gvm" ]] && source "/home/eralp/.gvm/scripts/gvm"

PATH="/home/eralp/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/eralp/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/eralp/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/eralp/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/eralp/perl5"; export PERL_MM_OPT;
