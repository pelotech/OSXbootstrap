#!/usr/bin/env bash

###############################################################################
# Bash                                                           #
###############################################################################

#Install and configure bash completions
brew install bash-completion
brew tap homebrew/completions
echo "[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion" >> ~/.bash_profile
