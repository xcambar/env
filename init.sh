#!/usr/bin/env zsh
source ~/.dotfiles/vms/nvm/nvm.sh
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

alias n=node
alias r=ruby
alias w=google-chrome

#Defines the helper to go directly to a subdirectory of $codePath
local codePath="$HOME/code/"
function c () {
  cd $codePath$1
}
compdef '_files -W "$codePath/" -/' c

#jsctags config
export NODE_PATH=/usr/local/lib/jsctags/:$NODE_PATH
