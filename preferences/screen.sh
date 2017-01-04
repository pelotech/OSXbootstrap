#!/usr/bin/env bash

###############################################################################
# Screen                                                                      #
###############################################################################

# Require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Hot corners
# Possible values:
#  0: no-op
#  2: Mission Control
#  3: Show application windows
#  4: Desktop
#  5: Start screen saver
#  6: Disable screen saver
#  7: Dashboard
# 10: Put display to sleep
# 11: Launchpad
# 12: Notification Center

# Top left screen corner → Mission Control
#defaults write com.apple.dock wvous-tl-corner -int 2
#defaults write com.apple.dock wvous-tl-modifier -int 0

# Bottom left screen corner → Desktop
#defaults write com.apple.dock wvous-tr-corner -int 5
#defaults write com.apple.dock wvous-tr-modifier -int 0

# Top right screen corner → Start screen saver
#defaults write com.apple.dock wvous-bl-corner -int 4
#defaults write com.apple.dock wvous-bl-modifier -int 0
