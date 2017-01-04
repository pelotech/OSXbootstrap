#!/usr/bin/env bash

###############################################################################
# Homebrew                                                                    #
###############################################################################

# cleanup
brew cleanup --force
rm -f -r /Library/Caches/Homebrew/*

echo ""
echo "\033[1m\033[32mPeloton Brew is complete. Happy Coding. \033[39m"
echo "\033[0m-------------------------------------------------------------------------"
echo ""
echo "bash and zshell completons are installed, your current shell is" $SHELL
echo ""
echo "* for zshell as default run 'chsh -s $(which zsh)'"
echo "* for bash as default run 'chsh -s /bin/bash'"
echo ""
echo "-------------------------------------------------------------------------"
echo ""
