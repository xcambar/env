#git

alias gxm="git checkout master && git fetch && git rebase origin/master && git branch --merged | grep -v \"\\*\" | xargs  -n 1 git branch -d"

#
# Defines Git aliases.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

#
# Settings
#
#

# Log
_git_log_medium_format='%C(bold)Commit:%C(reset) %C(green)%H%C(red)%d%n%C(bold)Author:%C(reset) %C(cyan)%an <%ae>%n%C(bold)Date:%C(reset)   %C(blue)%ai (%ar)%C(reset)%n%+B'
_git_log_oneline_format='%C(green)%h%C(reset) %s%C(red)%d%C(reset)'
_git_log_brief_format='%C(green)%h%C(reset) %s%n%C(blue)(%ar by %an)%C(red)%d%C(reset)%n'

# Status
zstyle -s ':prezto:module:git:status:ignore' submodules '_git_status_ignore_submodules' \
  || _git_status_ignore_submodules='none'

#
# Aliases
#

# Branch (b)
alias gb='git branch'
alias gbc='git checkout -b'
alias gbl='git branch -v'
alias gbL='git branch -av'
alias gbx='git branch -d'
alias gbX='git branch -D'
alias gbm='git branch -m'
alias gbM='git branch -M'
alias gbs='git show-branch'
alias gbS='git show-branch -a'

# Commit (c)
alias gc='which "git-cz" > /dev/null && git cz || git commit --verbose'
alias gca='git commit --verbose --all'
alias gcm='git commit --message'
alias gco='git checkout'
alias gcf='git commit --amend --reuse-message HEAD'
alias gcF='git commit --verbose --amend'
alias gcp='git cherry-pick --ff'
alias gcP='git cherry-pick --no-commit'
alias gcr='git revert'
alias gcR='git reset "HEAD^"'
alias gcl='git-commit-lost'
alias gcfu="git commit --fixup  \`glo | fzf | cut -d ' ' -f 1\`"
alias gcsq="git commit --squash \`glo | fzf | cut -d ' ' -f 1\`"

# Fetch (f)
alias gf='git fetch'
alias gfc='git clone'
alias gfm='git pull'
alias gfr='git pull --rebase'

# Index (i)
alias gia='git add'
alias giA='git add --patch'
alias giu='git add --update'
alias gir='git reset'
alias giR='git reset --patch'
alias gix='git rm -r --cached'
alias giX='git rm -rf --cached'

# Log (l)
alias gl='git log --topo-order --pretty=format:${_git_log_medium_format}'
alias gls='git log --topo-order --stat --pretty=format:${_git_log_medium_format}'
alias gld='git log --topo-order --stat --patch --full-diff --pretty=format:${_git_log_medium_format}'
alias glo='git log --topo-order --pretty=format:${_git_log_oneline_format}'
alias glg='git log --topo-order --all --graph --pretty=format:${_git_log_oneline_format}'
alias glb='git log --topo-order --pretty=format:${_git_log_brief_format}'
alias glc='git shortlog --summary --numbered'

# Merge (m)
alias gm='git merge'
alias gmC='git merge --no-commit'
alias gmF='git merge --no-ff'
alias gma='git merge --abort'
alias gmt='git mergetool'

# Push (p)
alias gp='git push'
alias gpf='git push --force'
alias gpa='git push --all'
alias gpA='git push --all && git push --tags'
alias gpt='git push --tags'

# Rebase (r)
alias gr='git rebase'
alias gra='git rebase --abort'
alias grc='git rebase --continue'
alias grs='git rebase --skip'
function gri() {
  local base
  if [[ -n "$1" ]]; then
    base="$1"
  else
    base=`glo | fzf | cut -d ' ' -f 1`
    base=`git rev-list --max-count=1 $base^1`
  fi
  git rebase --interactive --autosquash "$base"
}

# Remote (R)
alias gR='git remote'
alias gRl='git remote --verbose'
alias gRa='git remote add'
alias gRx='git remote rm'
alias gRm='git remote rename'
alias gRu='git remote update'
alias gRp='git remote prune'
alias gRs='git remote show'

# Stash (s)
alias gs='git stash'
alias gsa='git stash apply'
alias gsx='git stash drop'
alias gsX='git-stash-clear-interactive'
alias gsl='git stash list'
alias gsp='git stash pop'
alias gss='git stash save --include-untracked'
alias gsS='git stash save --patch --no-keep-index'
alias gsw='git stash save --include-untracked --keep-index'

# Working Copy (w)
alias gws='git status --ignore-submodules=none --short'
alias gwS='git status --ignore-submodules=none'
alias gwr='git reset --soft'
alias gwR='git reset --hard'
alias gwc='git clean -n'
alias gwC='git clean -f'
alias gwx='git rm -r'
alias gwX='git rm -rf'

# Diff (d)
alias gd='git diff'
alias gD='git diff --staged'
# alias gdw='git diff --word-diff --no-ext-diff'
# alias gDw='git diff --staged --word-diff --no-ext-diff'

# Reflog (rl)
alias grl="git reset --hard \`git reflog | fzf | cut -d ' ' -f 1\`"
