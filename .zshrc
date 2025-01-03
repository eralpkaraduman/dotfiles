# Based on this guide: https://www.viget.com/articles/zsh-config-productivity-plugins-for-mac-oss-default-shell/

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

alias nvim="nvm use 20 >/dev/null && nvim"
#
# Visual Studio Code
export REACT_EDITOR=nvim

# sudoedit editor
export SUDO_EDITOR=nvim

export VISUAL=nvim;
export EDITOR=nvim;

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
antigen bundle macos
antigen bundle fzf
antigen bundle yarn-autocompletions
antigen bundle npm
#antigen bundle node
#antigen bundle vi-mode
#antigen bundle virtualenv
#antigen bundle iterm2
#antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle command-not-found
#antigen bundle mafredri/zsh-async
antigen bundle lukechilds/zsh-better-npm-completion
#antigen bundle Aloxaf/fzf-tab
antigen apply

# Based on https://github.com/pndurette/zsh-lux/blob/main/zsh-lux.plugin.zsh
local dark_mode=$(osascript -l JavaScript -e \
    "Application('System Events').appearancePreferences.darkMode.get()")
if [[ "$dark_mode" == "true" ]]
  then 
    export DARK_THEME=1
    tmux set-environment -g THEME 'dark'
    export FZF_DEFAULT_OPTS='
    --color dark
    '
    export BAT_THEME=OneHalfDark
  else 
    export DARK_THEME=0
    tmux set-environment -g THEME 'light'
    export FZF_DEFAULT_OPTS='
    --color light
    '
    export BAT_THEME=OneHalfLight
fi
tmux source-file ~/.tmux.conf # so that tmux syncs the dark mode state

# Pure Prompt theme
ZSH_THEME="" #Disalbe oh-my-zsh themes
# Install pure prompt manually npm install --global pure-prompt
# Based on https://nicedoc.io/sindresorhus/pure#example
fpath+=$HOME/.zsh/pure
autoload -U promptinit; promptinit
PURE_CMD_MAX_EXEC_TIME=10
zstyle :prompt:pure:path color cyan
zstyle ':prompt:pure:prompt:*' color red
zstyle :prompt:pure:git:stash show yes
prompt pure


export PATH=$PATH:$HOME/tools/bin
export PATH=$PATH:$HOME/bin

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# x86 brew is here, tho I might have removed axbrew, line below could be obsolete
export PATH="/usr/local/bin:$PATH"

# Calling nvm use automatically in a directory with a .nvmrc file 
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    echo ".nvmrc detected"
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
        echo "nvm install..."
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      echo "nvm use..."
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

# Golang
#export GOPATH=$HOME/go
#export GOROOT=/usr/local/go
#export GOBIN=$GOPATH/bin
#export PATH=$PATH:$GOPATH
#export PATH=$PATH:$GOROOT/bin

# Keeping multiple versions of brew for librdkafka node module for gca server development
alias brew_arm64="/opt/homebrew/bin/brew"
alias brew_x86-64="/usr/local/bin/brew"
alias brew="brew_arm64"

# private stuff
source ~/.zshrc-private

# pnpm
export PNPM_HOME="/Users/eralp/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end
#
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

export PLAYDATE_SDK_PATH=/Users/eralp/Developer/PlaydateSDK
export PATH=$PATH:$PLAYDATE_SDK_PATH/bin
# bun completions
[ -s "/Users/eralp/.bun/_bun" ] && source "/Users/eralp/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/eralp/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/eralp/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/eralp/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/eralp/google-cloud-sdk/completion.zsh.inc'; fi

export PATH="/opt/homebrew/opt/python@3.10/libexec/bin:$PATH"
