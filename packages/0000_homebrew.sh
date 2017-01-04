#!/usr/bin/env bash

###############################################################################
# Homebrew                                                                    #
###############################################################################


#Get homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

#is this needed? not sure. Seems safe though.
brew update
