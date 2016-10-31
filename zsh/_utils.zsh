# Correct commands.
setopt CORRECT

#
# Aliases
#

# Disable correction.
alias ack='nocorrect ack'
alias cd='nocorrect cd'
alias cp='nocorrect cp'
alias grep='nocorrect grep'
alias ln='nocorrect ln'
alias man='nocorrect man'
alias mkdir='nocorrect mkdir'
alias mv='nocorrect mv'
alias rm='nocorrect rm'

# Disable globbing.
alias bower='noglob bower'
alias find='noglob find'
alias locate='noglob locate'

# Define general aliases.
alias cp="${aliases[cp]:-cp} -i"
alias ln="${aliases[ln]:-ln} -i"
alias mkdir="${aliases[mkdir]:-mkdir} -p"
alias mv="${aliases[mv]:-mv} -i"
alias rm="${aliases[rm]:-rm} -i"
alias type='type -a'

# ls
# Define colors for BSD ls.
export LSCOLORS='exfxcxdxbxGxDxabagacad'
# Define colors for the completion system.
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=36;01:cd=33;01:su=31;40;07:sg=36;40;07:tw=32;40;07:ow=33;40;07:'
alias ls='ls -G'

alias la='ls -lA'         # Lists human readable sizes, hidden files.
alias lA='la | "$PAGER"' # Lists human readable sizes, hidden files through pager.

if (( $+commands[htop] )); then
  alias top=htop
fi

# Miscellaneous

#
# Functions
#

# Makes a directory and changes to it.
function mkdcd {
  [[ -n "$1" ]] && mkdir -p "$1" && builtin cd "$1"
}

# Changes to a directory and lists its contents.
function cdls {
  builtin cd "$argv[-1]" && ls "${(@)argv[1,-2]}"
}

# Finds files and executes a command on them.
function find-exec {
  find . -type f -iname "*${1:-}*" -exec "${2:-file}" '{}' \;
}

# Displays user owned processes status.
function psu {
  ps -U "${1:-$USER}" -o 'pid,%cpu,%mem,command' "${(@)argv[2,-1]}"
}

alias dk='docker'
alias dkc='docker-compose'
function dksh() {
  [[ -z "$DOCKER_MACHINE_NAME" ]] && echo "No active docker machine" && return 1
  [[ -n "$COMPOSE_PROJECT_NAME" ]] && local prefix="${COMPOSE_PROJECT_NAME}_"
  local name=`docker ps --format "{{.Names}}" --filter "name=$prefix$1"`
  docker exec -it "$name" bash
}
alias dkm='docker-machine'
alias dkmls='docker-machine ls --quiet'
function dkma() {
  local machine=${1:-$COMPOSE_PROJECT_NAME}
  if [[ -z "$machine" ]]; then
    echo "No machine specified."
  else
    docker-machine start "$machine"
    eval $(docker-machine env "$machine")
  fi
}
function dkmh() {
  local machine=${1:-$COMPOSE_PROJECT_NAME}
  if [[ -z "$machine" ]]; then
    echo "No machine specified."
  else
    echo "Stopping machine $machine"
    docker-machine stop "$machine"
    eval $(docker-machine env -u)
  fi
}

function ssl-dev() {
  local _path=~/code/ssl_dev_config/
  local-ssl-proxy -s $1 -t $2 -k ${_path}ssl.key -c ${_path}ssl.crt
}

function serve() {
  local port=${1:-8000}
  echo "Serving on port $port"
  python -m SimpleHTTPServer "$port" > /dev/null 2>&1
}
