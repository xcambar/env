#
# Auto Start
#

if [[ -z "$TMUX" && -z "$EMACS" && -z "$VIM" ]]; then
  tmux_session='_default_'

  # Create the default '#Prezto' session if not available. 
  if ! tmux has-session -t "$tmux_session" 2> /dev/null; then
    tmux start-server \; new-session -d -s "$tmux_session" \; set-option -t "$tmux_session" destroy-unattached off &> /dev/null
  fi

  #By default, prezto sets destroy-unattached to on
  tmux_destroy_unattached=`tmux show-options -v -g destroy-unattached`
  if [[ -z "$tmux_destroy_unattached" ]]; then
    tmux set-option -g destroy-unattached on
  fi

  # Attach to the 'prezto' session or to the last session used.
  exec tmux attach-session
fi



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
