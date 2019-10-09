# Git
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

symbolicatecrash() {
# Step 1: List the available "symbolicatecrash" tools. We're looking for the "DVTFoundation" one
# find /Applications -name symbolicatecrash

# Step 2: Export the developer dir
# export DEVELOPER_DIR="/Applications/Xcode.app/Contents/Developer"

# Step 3: Run the script. The "dsyms" is a folder containing all the DSYMS.
# /Applications/Xcode.app/Contents/SharedFrameworks/DVTFoundation.framework/Versions/A/Resources/symbolicatecrash Passport.crash dsyms > Crash.crash

# The commented code is the manual stuff, the code that runs assumes stuff.
# $1 = Name of the input crash
# $2 = DSYM (or folder with DSYMS)
# $3 = Name of the output crash
export DEVELOPER_DIR="/Applications/Xcode.app/Contents/Developer"
/Applications/Xcode.app/Contents/SharedFrameworks/DVTFoundation.framework/Versions/A/Resources/symbolicatecrash $1 $2 > $3
}

export PS1="⚡️\[\033[32m\]\$(parse_git_branch)\[\033[00m\] "

#Alias
alias fuck_xcode="killall Xcode; rm -rf ~/Library/Developer/Xcode/DerivedData; open /Applications/Xcode.app/"
alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"
