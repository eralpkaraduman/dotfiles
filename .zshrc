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
setopt auto_menu
setopt always_to_end
setopt complete_in_word
unsetopt flow_control
unsetopt menu_complete
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion::complete:*' cache-path ':completion:*' list-colors ''
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'

# Complete stuff with fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Other
setopt prompt_subst

# Visual Studio Code
export REACT_EDITOR=nvim

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completionsource ~/.zsh_plugins.sh

# Antibody
source ~/.zsh_plugins.sh
# Add plugins to 
# ~/.zsh_plugins.txt
# Then run
# antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh

# Pure Prompt theme
# Based on https://nicedoc.io/sindresorhus/pure#example
autoload -U promptinit; promptinit
PURE_CMD_MAX_EXEC_TIME=10
zstyle :prompt:pure:path color white
zstyle ':prompt:pure:prompt:*' color cyan
zstyle :prompt:pure:git:stash show yes
prompt pure

# Java
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

# YLE AWS Tools
export PATH="$HOME/Projects/Yle/yle-aws-tools/bin:$PATH"

# Flutter (Overriden by HH Flutter)
# export PATH="$PATH:$HOME/flutter/bin"

# Python
export PATH="$PATH:/Users/eralpkaraduman/Library/Python/3.8/bin"

# Android
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# LOVE2D
export PATH=$PATH:/Applications/love.app/Contents/MacOS/

# HH
export PATH=$PATH:/Users/eralpkaraduman/Projects/Frogmind/HypeHype/depot_tools
export PATH=$PATH:/Users/eralpkaraduman/Projects/Frogmind/HypeHype/flutter/bin
export FLUTTER_ENGINE=/Users/eralpkaraduman/Projects/Frogmind/HypeHype/flutter-engine/src
export PATH=$PATH":"$HOME/.pub-cache/bin
export PINGPONG_ENVIRONMENT_NAME="local"
export FLUTTER_ENGINE_TYPE=host_debug_unopt

# Google Cloud
source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc
source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc

source ~/.zshrc-private
