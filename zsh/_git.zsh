#git

# gqs <-> git quick squash
#
# Rebases from the branch passed in arguments
# Squashes the commits on top of it
function gqs () {
  local branch=$1
  git fetch > /dev/null
  git rebase $branch > /dev/null
  local number_of_commits=`git log $branch..HEAD --pretty=oneline | wc -l | xargs`
  if [ $number_of_commits -gt 0 ]; then
    echo "squashing $number_of_commits commits"
    git rebase -i HEAD~$number_of_commits
  else
    echo "Nothing to squash"
  fi
}

alias gxm="git checkout master && git fetch && git rebase origin/master && git branch --merged | grep -v \"\\*\" | xargs  -n 1 git branch -d"
