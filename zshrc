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

# add plugin
zplug "zsh-users/zsh-completions"
zplug "junegunn/fzf-bin", as:command, from:gh-r, rename-to:fzf
zplug "junegunn/fzf", as:command, use:bin/fzf-tmux
zplug "peco/peco", as:command, from:gh-r
zplug "b4b4r07/dotfiles", as:command, use:bin/peco-tmux
zplug "b4b4r07/enhancd", use:enhancd.sh
zplug "sorin-ionescu/prezto"
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

zplug load

if zplug check b4b4r07/enhancd; then
  # enhancd がインストールされている場合のみ設定する
  export ENHANCD_FILTER=peco
fi

# Customize to your needs...

# path
export PATH="/usr/local/bin:$PATH"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

# ssh
export SSH_KEY_PATH="~/.ssh/dsa_id"

# macos setting
#export PATH="$HOME/.rbenv/bin:$PATH"
#eval "$(rbenv init -)"
#export PATH="~/Library/Android/sdk/platform-tools/:$PATH"

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

#aliases
alias ls="ls -G" # color for darwin
alias ll="ls -la"
alias tree="tree -NC" # N: 文字化け対策, C:色をつける
alias grep="grep --color -n -I --exclude='*.svn-*' --exclude='entries' --exclude='*/cache/*'"
alias diff="colordiff"
alias less="less -R"


