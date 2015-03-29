#
# tmux shortcut for creating/attaching named sessions
#
tm() {
  [[ -z "$1" ]] && { echo "usage: tm <session>" >&2; return 1; }
  if [[ "$1" == "new" ]] then
    if [[ -n "$TMUX" ]] then
      tmux detach
    fi
    tmux new-session
  else
    tmux has -t $1
    [[ $? == 0 ]] && tmux attach -t $1 || tmux new -s $1
  fi
}

# stolen from completion function _tmux
function __comp_tmux-sessions() {
    local expl
    local -a sessions
    sessions=( 'new':'Opens a new unnamed session' ${${(f)"$(command tmux list-sessions)"}/:[ $'\t']##/:})
    _describe -t sessions 'sessions' sessions "$@"
}
compdef __comp_tmux-sessions tm
