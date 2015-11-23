# Use git by default
export FZF_DEFAULT_COMMAND='(git ls-tree -tr --name-only HEAD ||
  find * -name ".*" -prune -o -type f -print -o -type l -print -o -type d -print) 2> /dev/null'

export FZF_DEFAULT_OPTS='-x -m +2 --ansi'

# Adapted from the default fzf config file
unalias fzf 2> /dev/null
unset fzf 2> /dev/null

__fsel() {
  if [ -n "$FZF_DEFAULT_COMMAND" ]; then
    fzf
  else
    command find -L . \( -path '*/\.*' -o -fstype 'dev' -o -fstype 'proc' \) -prune \
      -o -type f -print \
      -o -type d -print \
      -o -type l -print 2> /dev/null | sed 1d | cut -b3- | fzf -m | while read item; do
    printf '%q ' "$item"
  done
  echo
fi
}

if [[ $- =~ i ]]; then

  local mypath=$0:A
  if [ -n "$TMUX_PANE" -a ${FZF_TMUX:-1} -ne 0 -a ${LINES:-40} -gt 15 ]; then
    fzf-file-widget() {
      local script_path="$mypath"
      # local script_path="$HOME/.fzf.zsh"
      local height
      height=${FZF_TMUX_HEIGHT:-40%}
      if [[ $height =~ %$ ]]; then
        height="-p ${height%\%}"
      else
        height="-l $height"
      fi
      tmux split-window $height "zsh -c 'source $script_path; tmux send-keys -t $TMUX_PANE \"\$(__fsel)\"'"
    }
  else
    fzf-file-widget() {
      LBUFFER="${LBUFFER}$(__fsel)"
      zle redisplay
    }
  fi
  # unset mypath
  zle     -N   fzf-file-widget
  bindkey '^T' fzf-file-widget


  # CTRL-R - Paste the selected command from history into the command line
  fzf-history-widget() {
    LBUFFER=$(fc -l 1 | fzf +s --tac +m -n2..,.. | sed "s/ *[0-9*]* *//")
    zle redisplay
  }
  zle     -N   fzf-history-widget
  bindkey '^R' fzf-history-widget

fi
