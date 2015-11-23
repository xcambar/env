# http://dougblack.io/words/zsh-vi-mode.html

bindkey -v

bindkey -M viins 'ii' vi-cmd-mode
bindkey -M vicmd 'ii' vi-insert

# Makes fn-backspace work on OSX
bindkey "^[[3~" delete-char

bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward

export KEYTIMEOUT=25
