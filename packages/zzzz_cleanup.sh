#!/usr/bin/env bash

###############################################################################
# Homebrew                                                                    #
###############################################################################

# cleanup
brew cleanup --force
rm -f -r /Library/Caches/Homebrew/*

echo ""
echo "Package installation complete. Happy Coding."
echo "-------------------------------------------------------------------------"
echo ""
echo "bash and zshell completons are installed, your current shell is" $SHELL
echo ""
echo "* for zshell as default run 'chsh -s $(which zsh)'"
echo "* for bash as default run 'chsh -s /bin/bash'"
echo ""
echo "-------------------------------------------------------------------------"
echo ""
