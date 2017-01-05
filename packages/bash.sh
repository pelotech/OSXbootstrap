#!/usr/bin/env bash

###############################################################################
# Bash                                                           #
###############################################################################

#Install and configure bash completions
brew install bash-completion
brew tap homebrew/completions
echo "[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion" >> ~/.bash_profile

# Switch to using brew-installed bash as default shell
if ! fgrep -q '/usr/local/bin/bash' /etc/shells; then
  echo '/usr/local/bin/bash' | sudo tee -a /etc/shells;
  chsh -s /usr/local/bin/bash;
fi;
