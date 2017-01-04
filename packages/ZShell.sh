#!/usr/bin/env bash

###############################################################################
# zshell                                                                      #
###############################################################################

#Install and configure zsh & completions
brew install zsh
brew install zsh-completions
touch ~/.zshrc
echo "fpath=(/usr/local/share/zsh-completions $fpath)" >> ~/.zshrc
rm -f ~/.zcompdump; compinit
chmod go-w '/usr/local/share'
