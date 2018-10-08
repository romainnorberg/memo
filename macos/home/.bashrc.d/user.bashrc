parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Wrap git. On errors, print an additional line in red.
git(){
    command git "$@"
    local exitCode=$?
    if [ $exitCode -ne 0 ]; then
        printf "\033[0;107mERROR: git exited with code $exitCode\033[0m\n"
        printf "\033[0;107m ____  ____  ____   __   ____  \033[0m\n"
        printf "\033[0;107m(  __)(  _ \(  _ \ /  \ (  _ \ \033[0m\n"
        printf "\033[0;107m ) _)  )   / )   /(  O ) )   / \033[0m\n"
        printf "\033[0;107m(____)(__\_)(__\_) \__/ (__\_) \033[0m\n"
        return $exitCode
    fi
}

# show time, path and current branch (e.g.: "07:24:53 project (feat-searchEngineEvol)$ ", doc: https://www.ibm.com/developerworks/linux/library/l-tip-prompt/)
export PS1="\[\e]2;\u@\H \w\a\e[32;1m\]\[\033[1m\]\t \W\[\e[0m\]\[\033[00m\]\\[\033[30m\]\$(parse_git_branch)\[\033[00m\]\$ "

# enable colors mode
export CLICOLOR=1

# History with datetime
export HISTTIMEFORMAT="%d/%m/%y %T "

# Autocompletion
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# MYSQL
export PATH=$PATH:/usr/local/mysql/bin/
