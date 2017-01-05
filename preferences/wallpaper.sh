
#!/usr/bin/env bash

###############################################################################
# Set wallpaper and login background                                          #
###############################################################################

osascript <<END
	tell application "System Events"
    set desktopCount to count of desktops
    repeat with desktopNumber from 1 to desktopCount
      tell desktop desktopNumber
        set picture to "\\\\..\\\\wallpaper.png"
      end tell
    end repeat
  end tell
END



  #Change login screen background
  sudo defaults write /Library/Preferences/com.apple.loginwindow DesktopPicture "..\login.png"
