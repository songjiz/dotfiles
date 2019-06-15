# Git aliases
alias g="git"

alias ga="git add"
alias gaa="git add --all"

alias gb="git branch"
alias gba="git branch -a"
alias gbd="git branch -d"
alias gbD="git branch -D"
alias gbl="git blame -bw"
alias gbr="git branch --remote"
alias gbu="git branch -u"
alias gwho="git blame -bw"

alias gc="git commit -v"
alias gca="git commit -v -a"
alias gcb="git checkout -b"
alias gci="git commit --interactive"
alias gcl="git clone --recursive"
alias gcm="git commit -v -m"
alias gco="git checkout"
alias gcp="git cherry-pick"
alias gcpa="git cherry-pick --abort"
alias gcpc="git cherry-pick --continue"

alias gd="git diff"
alias gdt="git diff-tree --no-commit-id --name-only -r"
alias gdw="git diff --word-diff"

alias gf="git fetch"
alias gfa="git fetch --all --prune"
alias gfo="git fetch origin"

alias gi="git init"

alias gl="git pull"

alias gm="git merge"
alias gmom="git merge origin/master"

alias gp="git push"
alias gpo="git push origin "

alias gra="git remote add"
alias grb="git rebase"
alias grba="git rebase --abort"
alias grbc="git rebase --continue"
alias grbs="git rebase --skip"
alias grh="git reset HEAD"
alias grhh="git reset HEAD --hard"

alias gs="git status"
alias gsb="git status -sb"
alias gstc="git stash clear"
alias gstd="git stash drop"
alias gstl="git stash list"
alias gstp="git stash pop"
alias gsts="git stash save"
alias gsi="git submodule init"
alias gsu="git submodule update"

alias gt="git tag"
alias gts="git tag -s"

github_user="songjiz"
bitbucket_user="songjiz"

# Setup syncronization of current Git repo with GitHub repo of the same name
# USAGE: git-github [repo]
function git-github() {
  local repo=${1-`basename "$(pwd)"`}
  git remote add origin "git@github.com:$github_user/$repo.git"
  git push -u origin master
}

# Setup syncronization of current Git repo with Bitbucket repo of the same name
# USAGE: git-bitbucket [repo]
function git-bitbucket() {
  local repo=${1-`basename "$(pwd)"`}
  git remote add origin "git@bitbucket.org:$bitbucket_user/$repo.git"
  git push -u origin master
}

# Add remote upstream
# USAGE: git-fork <original-author>
function git-fork() {
  local user=$1
  if [[ "$user" == "" ]]; then
    echo "Usage: git-fork <original-author>"
  else
    local repo=`basename "$(pwd)"`
    git remote add upstream "git@github.com:$user/$repo.git"
  fi
}

# Sync branch with upstream
# USAGE: git-upstream [branch]
function git-upstream() {
  local branch=${1-master}
  git fetch upstream
  git checkout $branch
  git rebase upstream/$branch
}

# Add all staged files to previous commit
function git-append() {
  git log -n 1 --pretty=tformat:%s%n%n%b | git commit -F - --amend
}

# List of files with unresolved conflicts
function git-conflicts() {
  git ls-files -u | awk '{ print $4 }' | sort -u
}
