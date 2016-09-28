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

# Customize to your needs...

# path
export PATH=/usr/local/bin

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

# rbenv setting
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="~/Library/Android/sdk/platform-tools/:$PATH"
eval "$(rbenv init -)"

# delete, home, end key binding
bindkey -e
bindkey "^?"    backward-delete-char
bindkey "^H"    backward-delete-char
bindkey "^[[3~" delete-char
bindkey "^[[1~" beginning-of-line
bindkey "^[[4~" end-of-line

stty -ixon -ixoff

#aliases
alias ls="ls -G" # color for darwin
alias ll="ls -la"
alias tree="tree -NC" # N: 文字化け対策, C:色をつける
alias grep="grep --color -n -I --exclude='*.svn-*' --exclude='entries' --exclude='*/cache/*'"
alias diff="colordiff"
alias less="less -R"




