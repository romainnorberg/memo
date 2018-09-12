function commit() {
    git commit -m "$1"
} 

alias st='git status'
alias dt='git difftool'
alias undo='git reset --soft HEAD^'
alias commit=commit