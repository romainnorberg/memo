# Macos install

# Global

## Apps
- Iterm2
- Sublime Text 3

## CLI
### Step 1
- homebrew: `$ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
`
- bash completion: `brew install bash-completion`
- PHP7.2 + COMPOSER: `brew update && brew install php72 && brew install composer && composer -V`
- `brew install bat` _(doc: https://remysharp.com/2018/08/23/cli-improved)_
- `brew install node`
- `npm install diff-so-fancy -g`
- copy `bashrc.d` [directory](https://github.com/romainnorberg/memo/tree/master/macos/home/bashrc.d) to home directory

### Step 2
- take a coffee :coffee:

### Step 3
- Sublime Text cli shortcut `ln -s "/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl`
- copy/replace `.gitignore` and `gitexcludes` files to home directory

# Nodejs
- `npm install -g nodemon`

# Various
- `npm install -g gitmoji-commit-hook` (doc: https://github.com/tjoskar/gitmoji-commit-hook)
- `defaults write com.apple.screencapture type jpg` _Save Screenshots as JPG_

