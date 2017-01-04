#!/usr/bin/env bash

###############################################################################
# Disable guest access                                                        #
###############################################################################

sudo defaults write /Library/Preferences/com.apple.loginwindow GuestEnabled -bool NO
sudo defaults write /Library/Preferences/com.apple.AppleFileServer guestAccess -bool NO
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server AllowGuestAccess -bool NO

echo "WARNTING - Guest Account may still be enabled on the login screen... this is an Apple bug!"
echo "This is an apple bug involving ind My Mac. If so, please see the comments in disable_guest.sh"


#WARNTING - Guest Account may still be enabled on the login screen... this is an Apple bug!
#To Fix....  http://forums.macrumors.com/threads/guest-user-account-bug.1926464/.
#1. Make sure “Find My Mac” and Guest User are disabled, reboot;
#2. Check whether System Integrity Protection is enabled or disabled by running: csrutil status at the Terminal.
#3. If it says "System Integrity Protection status: enabled." proceed to 4.1,
#4. if not, only do 4.4 and 4.7;
#4.1. Reboot into "Recovery Mode": Shutdown and hold Command + R after pressing the power button;​
#4.2. Go into "Utilities > Terminal" and run the command: csrutil disable;​
#4.3. Reboot;​
#4.4. Open the Terminal and run: sudo touch /System/Library/PrivateFrameworks/EFILogin.framework/Resources/EFIResourceBuilder.bundle/Contents/Resources, this will force the EFI login update;
#4.5. Reboot(again) into "Recovery Mode": Shutdown and hold Command + R after pressing the power button;
#4.6. Go into "Utilities > Terminal" and run the command: csrutil enable;
#4.7. Reboot and it’s fixed - no Guest login!
#4.8. Re enable “Find My Mac” AND re-dissable Guest Login (cause find my mac will re-flip the flag)
#4.9. Reboot as much as you want
