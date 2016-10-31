# Use git by default
export FZF_DEFAULT_COMMAND='ag -g "" 2> /dev/null'
# export FZF_DEFAULT_COMMAND='(git ls-tree -tr --name-only HEAD || ag -g "") 2> /dev/null'

export FZF_DEFAULT_OPTS='-x -m +2 --ansi'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
