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

# fastest possible way to check if repo is dirty
prompt_pure_git_dirty() {
  # git info
  vcs_info

  # check if we're in a git repo
  [[ "$(command git rev-parse --is-inside-work-tree 2>/dev/null)" == "true" ]] || return
  # check if it's dirty

  local git_status=`echo $vcs_info_msg_0_ | xargs`
  command test -n "$(git status --porcelain --ignore-submodules -uno)" \
    && echo "%F{16}($git_status)%f" \
    || echo "%F{7}($git_status)%f"
}

prompt_pure_precmd() {
  print -P "\n %F{blue}%~ \e[3m`prompt_pure_git_dirty`\e[23m"
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
