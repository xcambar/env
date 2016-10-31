# Adapted from:
#
# Pure
# by Sindre Sorhus
# https://github.com/sindresorhus/pure
# MIT License

# For my own and others sanity
# git:
# %b => current branch
# %a => current action (rebase/merge)
# prompt:
# %F => color dict
# %f => reset color
# %~ => current path
# %* => time
# %n => username
# %m => shortname host
# %(?..) => prompt conditional - %(condition.true.false)

strlen () {
  FOO=$1
  local zero='%([BSUbfksu]|([FB]|){*})'
  LEN=${#${(S%%)FOO//$~zero/}}
  echo $LEN
}

# fastest possible way to check if repo is dirty
prompt_pure_git_dirty() {
  function join { local IFS="$1"; shift; echo "$*";  }

  local status_char="◼ "

  # git info
  vcs_info

  # check if we're in a git repo
  [[ "$(command git rev-parse --is-inside-work-tree 2>/dev/null)" == "true" ]] || return

  local git_status="$(git status --porcelain 2> /dev/null)"
  ## Unstaged changes
  if [[ $git_status =~ ($'\n'|^).[MD] ]]; then local has_unstaged="%F{1}$status_char%f"; fi
  ## Staged changes
  if [[ $git_status =~ ($'\n'|^)[MADR] ]]; then local has_staged="%F{2}$status_char%f"; fi
  ## Untracked files
  grep -c "^??" > /dev/null <<< $git_status && local has_untracked="$status_char"

  [[ -z "$has_unstaged$has_staged$has_untracked" ]] || local repo_status=" $has_unstaged$has_staged$has_untracked"

  local git_branch=`echo $vcs_info_msg_0_ | xargs`
  echo  " %F{6}$git_branch%f$repo_status"
}

function docker_indicator() {
  if [[ -n "$DOCKER_MACHINE_NAME" ]]; then
    [[ `docker-machine ls --quiet --filter "state=Running" | wc -l | xargs` > 1 ]] && local _color="red" || local _color="grey"
    echo " %F{$_color}[🐳  $DOCKER_MACHINE_NAME]%f"
  fi
}

prompt_pure_precmd() {
  local _pre="\n %F{blue}%~`prompt_pure_git_dirty`"
  local _docker="`docker_indicator`"
  # local _len=$(( `tput cols` - $( strlen _docker ) - $( strlen _pre ) ))
  print -P "$_pre$_docker"
}

#
# vim mode
#
function zle-line-init zle-keymap-select {
  # prompt turns red if the previous command didn't exit with 0
  DEFAULT_PROMPT=" %(?.%F{5}.%F{9})❯%f"

  VIM_PROMPT="%F{3} ⬢%f"
  PROMPT="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/$DEFAULT_PROMPT} "
  zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select


prompt_pure_setup() {
  # prevent percentage showing up
  # if output doesn't end with a newline
  export PROMPT_EOL_MARK=''

  # disable auth prompting on git 2.3+
  export GIT_TERMINAL_PROMPT=0

  prompt_opts=(cr subst percent)

  autoload -Uz add-zsh-hook
  autoload -Uz vcs_info

  add-zsh-hook precmd prompt_pure_precmd

  zstyle ':vcs_info:*' enable git
  zstyle ':vcs_info:git*' formats ' %b'
  zstyle ':vcs_info:git*' actionformats ' %b|%a'
}

prompt_pure_setup "$@"
