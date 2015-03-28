#
# A minimal theme for my minimal needs.
#

# autoload -Uz promptinit && promptinit

function prompt_xcambar_precmd {
  setopt LOCAL_OPTIONS
  unsetopt XTRACE KSH_ARRAYS
  function prompt_width () {
    echo $(( ${#${(S%%)1//(\%([KF1]|)\{*\}|\%[BbkfUu])}} ))
  }

  if (( $+functions[git-info] )); then
    git-info
  fi

  local no_git=" %F{01}(╯°∿°)╯ ┻━┻%f"
  local _prompt_left="%F{08}${(l:2::·:)} %F{14}%~%f "
  local _prompt_right="${git_info[prompt]:-${no_git}} %F{08}${(l:2::·:)}%f"

  local line1_left_width=$(prompt_width $_prompt_left)
  local line1_right_width=$(prompt_width $_prompt_right)
  local screen_width=$(tput cols)
  local filler_width=(( $screen_width - $line1_left_width - $line1_right_width - 1))
  local _prompt_filler="%{%F{08}%}${(l:$filler_width::·:)}%{$reset_color%}"

  PROMPT="
${_prompt_left}${_prompt_filler}${_prompt_right}    ツ "

}

function __prompt {
  setopt LOCAL_OPTIONS
  unsetopt XTRACE KSH_ARRAYS
  prompt_opts=(cr percent subst)

  # Load required functions.
  autoload -Uz add-zsh-hook

  # Add hook for calling vcs_info before each command.
  add-zsh-hook precmd prompt_xcambar_precmd

  #If plain text is boring, maybe use colored versions of ●
  zstyle ':prezto:module:git:info:branch' format ' %U%F{81}%b%f%u'
  zstyle ':prezto:module:git:info:untracked' format ' %F{161}untracked%f'
  zstyle ':prezto:module:git:info:unindexed' format ' %F{166}unstaged%f'
  zstyle ':prezto:module:git:info:indexed' format ' %F{118}staged%f'
  zstyle ':prezto:module:git:info:keys' format \
    'prompt' '%b%u%i%I'

  # TODO Move it left
  # zstyle ':prezto:module:editor:info:keymap:alternate' format "%B%F{160}◀■■■%f%b"
  # RPROMPT=${editor_info[keymap]}
}

__prompt "$@"
