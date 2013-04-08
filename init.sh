#!/usr/bin/env zsh
PATH="/usr/local/bin:$PATH" # Prefer brew over system

source ~/.env/vms/nvm/nvm.sh
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
PATH=$PATH:/usr/local/share/python # Homebrew python executables
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

#Defines the helper to go directly to a subdirectory of $codePath
local HullCodePath="$codePath/Hull.io/"
function ch () {
  cd $HullCodePath$1
}
compdef '_files -W "$HullCodePath/" -/' ch

#jsctags config
export NODE_PATH=/usr/local/lib/jsctags/:$NODE_PATH
source /Users/xav/.rvm/environments/default

function npm-exec () {
  PATH=$(npm bin):$PATH $@
}

function _comp_npm () {
  _arguments '1: :->command_'
  case $state in
    command_)
      _files -W "$(npm bin)" -/
      ;;
    *)
      _files
      ;;
  esac
}

compdef _comp_npm npm-exec

source /usr/local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh
