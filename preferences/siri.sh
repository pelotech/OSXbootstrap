#!/usr/bin/env bash

###############################################################################
# Siri                                                                     #
###############################################################################


# Me: Siri, it's not you, it's me.
# Siri: sorry, I didn't get that.
# Me: Ok, it's you.

defaults write com.apple.Siri StatusMenuVisible -bool false
defaults write com.apple.Siri UserHasDeclinedEnable -bool true
defaults write com.apple.Siri Disabled -bool true


#If you reboot and Siri is still enabled follow these steps

	#Remove Siri from the touchbar
#Go to System Preferences => Keyboard => Customize Control Strip.
#Move the pointer below the screen to where siri is, drag it up and out of the touchbar.

# from -http://apple.stackexchange.com/questions/258816/how-to-completely-disable-siri-on-sierra
# * Reboot in Recovery mode by restarting your Mac and holding Command+R. It can take more time to boot as usual, that's OK, just be patient.
# * In top menu go to Utilities and open Terminal.
# * Type csrutil disable and press Enter
# * Type reboot and press Enter to reboot again.
# * Open Terminal.app
# * Type sudo nano /System/Library/LaunchAgents/com.apple.Siri.plist to open the file in nano editor with root privileges.
#      Find the following lines
#      <key>Disabled</key>
#      <false/>
#      and change them to
#      <key>Disabled</key>
#     <true/>
#    Press Control+X then y and then Enter to save the file and exit nano.
# Reboot in Recovery mode by restarting your Mac and holding Command+R
# In top menu go to Utilities > Terminal
# Type 'csrutil enable' and press Enter
# Type reboot and press Enter to reboot again.

#Now if you check Activity Monitor - you should see no traces of Siri there.
#You can repeat this procedure with /System/Library/LaunchAgents/com.apple.assistantd.plist
# to disable it either.
