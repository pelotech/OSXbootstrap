#!/usr/bin/env bash

###############################################################################
# Bash                                                           #
###############################################################################


#install or update bash
if brew list -1 | grep -q "^bash\$"; then
	brew update bash
else
	brew install bash
	#Switch to using brew-installed bash as default shell
 	if ! fgrep -q '/usr/local/bin/bash' /etc/shells; then
	 echo '/usr/local/bin/bash' | sudo tee -a /etc/shells;
	 chsh -s /usr/local/bin/bash;
 	fi
fi

if brew list -1 | grep -q "^bash-completion\$"; then
	brew update bash-completion
else
	brew install bash-completion
	brew tap homebrew/completions
	echo "[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion" >> ~/.bash_profile
fi
