#!/usr/bin/env bash

###############################################################################
# Chrome                                                                      #
###############################################################################

killall Chrome

brew cask install google-chrome
#Set chrome as the default browser
open -a "Google Chrome" --args --make-default-browser
