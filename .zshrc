# Symbolicate crash logs 
function symbolicatecrash() {
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

# Start
# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats '(%b) '

# Set up the prompt (with git branch name)
setopt PROMPT_SUBST
PROMPT='
╭── %226F%~%f %F{green}${vcs_info_msg_0_}%f
╰─○ '

#Alias
alias ffs="killall Xcode; rm -rf ~/Library/Developer/Xcode/DerivedData; open /Applications/Xcode.app/"
alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"
alias sb="xcrun simctl status_bar booted override --time 9:41 --cellularBars 4"
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
