#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Essential
source ~/.zplug/init.zsh

# prezto
zplug "sorin-ionescu/prezto"
# prezto plugin
zplug "modules/environment", from:prezto
zplug "modules/terminal", from:prezto
zplug "modules/editor", from:prezto
zplug "modules/history", from:prezto
zplug "modules/directory", from:prezto
zplug "modules/spectrum", from:prezto
zplug "modules/utility", from:prezto
zplug "modules/completion", from:prezto
zplug "modules/prompt", from:prezto
# add plugin
zplug "b4b4r07/enhancd", use:init.sh
zplug "b4b4r07/dotfiles", as:command, use:bin/peco-tmux
zplug "plugins/git", from:oh-my-zsh
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "felixr/docker-zsh-completion"

# Install packages that have not been installed yet
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    else
        echo
    fi
fi
zplug load --verbose

if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

if zplug check b4b4r07/enhancd; then
  # enhancd がインストールされている場合のみ設定する
  export ENHANCD_FILTER=peco
fi

# Customize to your needs...

# environment for n
export N_PREFIX="$HOME/n"

# path
export PATH="/usr/local/bin:$N_PREFIX/bin:$PATH"
export PATH=$PATH:/usr/local/opt/go/libexec/bin

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Preferred editor for local and remote sessions
export EDITOR='vim'

# History Size
export HISTSIZE=10000

# ssh
export SSH_KEY_PATH="~/.ssh/dsa_id"

# macos setting
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# android platform-tools
export PATH="~/Library/Android/sdk/platform-tools/:$PATH"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# delete, home, end key binding
#bindkey -e
#bindkey "^?"    backward-delete-char
#bindkey "^H"    backward-delete-char
#bindkey "^[[3~" delete-char
#bindkey "^[[1~" beginning-of-line
#bindkey "^[[4~" end-of-line

# aliases
alias ls="ls --color=always"
alias ll="ls -la"
alias tree="tree -NC" # N: 文字化け対策, C:色をつける
alias grep="grep --color -n -I --exclude='*.svn-*' --exclude='entries' --exclude='*/cache/*'"
alias diff="colordiff"
alias less="less -R"

# key bind
bindkey "^[OH" beginning-of-line
bindkey "^[OF" end-of-line
bindkey "^[[3~" delete-char

# color
export TERM=xterm-256color


export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).
