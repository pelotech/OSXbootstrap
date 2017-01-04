#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

function doIt() {
	rsync --exclude ".git/" \
		--exclude ".DS_Store" \
		--exclude "bootstrapOSX.sh" \
		--exclude "README.md" \
		--exclude "LICENSE-MIT.txt" \
		-avh --no-perms . ~;


		# Close any open System Preferences panes, to prevent them from overriding
		# settings we’re about to change
		osascript -e 'tell application "System Preferences" to quit'

		# Ask for the administrator password upfront
		sudo -v

		# Keep-alive: update existing `sudo` time stamp until `faster_osx.sh` has finished
		while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

		# Set standby delay to 24 hours (default is 1 hour)
		sudo pmset -a standbydelay 86400


    for file in ~/{preferences,extras}/*; do
  		echo $file
			source $file
    done;
    unset file;


}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
else
	read -p "This will overwrite some of your OSX preferences. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;
