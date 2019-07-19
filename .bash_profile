# Git
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="⚡️\[\033[32m\]\$(parse_git_branch)\[\033[00m\] "

#Alias
alias fuck_xcode="killall Xcode; rm -rf ~/Library/Developer/Xcode/DerivedData; open /Applications/Xcode.app/"
alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"
