#!/usr/bin/env bash

###############################################################################
# Disable guest access                                                        #
###############################################################################


sudo defaults write /Library/Preferences/com.apple.loginwindow GuestEnabled -bool NO
sudo defaults write /Library/Preferences/com.apple.AppleFileServer guestAccess -bool NO
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server AllowGuestAccess -bool NO
