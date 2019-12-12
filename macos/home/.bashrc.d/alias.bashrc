# FINDER
alias ll='ls -lha'

# MYSQL
alias mysql-restart='launchctl unload -w ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist && launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist'

# TOOLS
alias cat='bat'
alias help='tldr'

# SSH
alias ssh=~/.bashrc.d/iterm/ssh-color

# PHP
alias phpunit="vendor/bin/phpunit"
alias phpunitw="phpunit-watcher watch"
alias c="composer"
alias cu="composer update"
alias cr="composer require"
alias ci="composer install"
alias cda="composer dump-autoload -o"
alias p="phpunit"
alias pf="phpunit --filter "
alias copykey='command cat ~/.ssh/id_rsa.public | pbcopy'

# PhpStorm
alias phpstorm='open -a /Applications/PhpStorm.app "`pwd`"'

# IP addresses
alias ip="curl https://diagnostic.opendns.com/myip ; echo"
