#!/bin/bash
# Get the Username of the currently logged user
loggedInUser=`/bin/ls -l /dev/console | /usr/bin/awk '{ print $3 }'`
if [ -e /usr/local/bin/mysides ]
then
	su - "$loggedInUser" -c "/usr/local/bin/mysides remove All\ My\ Files file:///System/Library/CoreServices/Finder.app/Contents/Resources/MyLibraries/myDocuments.cannedSearch/" && sleep 2
	su - "$loggedInUser" -c "/usr/local/bin/mysides remove iCloud x-apple-finder:icloud" && sleep 2
	su - "$loggedInUser" -c "/usr/local/bin/mysides remove domain-AirDrop nwnode://domain-AirDrop" && sleep 2
fi

#home directory
/usr/bin/sfltool add-item com.apple.LSSharedFileList.FavoriteItems file:///Users/$loggedInUser && sleep 2
#Desktop
/usr/bin/sfltool add-item com.apple.LSSharedFileList.FavoriteItems file:///Users/$loggedInUser/Desktop && sleep 2

#Documents
/usr/bin/sfltool add-item com.apple.LSSharedFileList.FavoriteItems file:///Users/$loggedInUser/Documents && sleep 2

#Downloads
/usr/bin/sfltool add-item com.apple.LSSharedFileList.FavoriteItems file:///Users/$loggedInUser/Downloads && sleep 2

#Code
/usr/bin/sfltool add-item com.apple.LSSharedFileList.FavoriteItems file:///Users/$loggedInUser/Code && sleep 2
touch /Users/$loggedInUser/.sidebarshortcuts

#/usr/libexec/PlistBuddy -c "Add :networkbrowser:CustomListProperties:com.apple.NetworkBrowser.backToMyMacEnabled bool False" /Users/$loggedInUser/Library/Preferences/com.apple.sidebarlists.plist
#/usr/libexec/PlistBuddy -c "Add :networkbrowser:CustomListProperties:com.apple.NetworkBrowser.bonjourEnabled bool False" /Users/$loggedInUser/Library/Preferences/com.apple.sidebarlists.plist

#hide the iCloud section
#defaults write  /home/$loggedInUser/Library/Preferences/com.apple.finder SidebariCloudSectionDisclosedState -int 0

#hide the shared section
#defaults write  /home/$loggedInUser/Library/Preferences/com.apple.finder SidebarSharedSectionDisclosedState -int 0

sudo killall Finder

killall cfprefsd
