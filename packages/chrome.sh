#!/usr/bin/env bash

###############################################################################
# Chrome                                                                      #
###############################################################################


#install or update atom
if brew cask list -1 | grep -q "^google-chrome\$"; then
	brew cask update google-chrome
else
	brew cask install google-chrome
fi
killall Chrome

#Set chrome as the default browser
open -a "Google Chrome" --args --make-default-browser
