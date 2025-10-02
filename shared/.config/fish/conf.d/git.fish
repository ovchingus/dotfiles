# Inspired by https://github.com/davidde/git
# I manually picked only essential ones, that i use in daily work

alias ga='git add'

alias gb='git branch'
alias gbd='git branch --delete'

alias gc='git commit --verbose'
alias gcm='git commit -m'

alias gco='git checkout'
alias gcob='git checkout -b'
alias gcom='git checkout $(git_main_branch)'

alias gcp='git cherry-pick'

alias gf='git fetch'

# Best default 'git log':
alias gl='glog --name-status'
# Fancy 'git log --oneline':
alias glo='git log --date=format:"%d/%m/%y" --pretty=format:"%C(yellow)%h%Creset   %C(white)%ad%Creset   %C(bold)%s    %C(bold green)%D%Creset"'
# Regular 'git log' in style:
alias glog='git log --date=format:"%A %B %d %Y at %H:%M" --pretty=format:"%C(yellow)%H%Creset%x09%C(bold green)%D%Creset%n%<|(40)%C(white)%ad%x09%an%Creset%n%n    %C(bold)%s%Creset%n%w(0,4,4)%n%-b%n"' # %w(0,4,4): no line-wrap, indent first line 4 chars, subsequent lines also 4 lines

alias gm='git merge'
alias gmom='git merge origin/$(git_main_branch)'

alias gp='git push'
alias gpf='git push --force-with-lease'

alias gpl='git pull'

alias gr='git reset --mixed' # Keep changes, but unstage them (`--mixed` = default behaviour)
alias grhard='git reset --hard' # Remove changes, including anything uncommitted (Dangerous!)
alias grk='git reset --keep' # Safer version of `--hard`: reset is aborted if a file is dirty
alias grs='git reset --soft' # Keep changes, and keep them staged

alias grb='git rebase'
alias grbm='git rebase $(git_main_branch)'

alias gs='git status'

# Check if main exists and use instead of master:
function git_main_branch
    if git branch --list main >/dev/null
        echo main
    else
        echo master
    end
end
