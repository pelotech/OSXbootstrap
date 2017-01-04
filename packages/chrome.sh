#!/usr/bin/env bash

###############################################################################
# Chrome                                                                      #
###############################################################################

brew cask install google-chrome
#Set chrome as the default browser
open -a "Google Chrome" --args --make-default-browser
