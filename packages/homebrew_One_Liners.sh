#!/usr/bin/env bash

###############################################################################
# Homebrew packages that have no aditional configuration                      #
###############################################################################

doUpdate=false;

#Install packages if they aren't already
declare -a pkgs=(	git
									node
									wget
								)

for pkg in "${pkgs[@]}"; do
    if brew list -1 | grep -q "^${pkg}\$"; then
			doUpdate=true;
		else
			brew install $pkg
    fi
done


#Install casks if they aren't already
declare -a casks=(	insync				#mount & sync multiple google drive accounts
										google-drive
										slack
										zoomus				#video conference
										caffeine
										dropbox
										screenhero		#remote pair programming
										macdown				#mark down editor
										intellij-idea #java ide
									)

for cask in "${casks[@]}"; do
    if brew cask list -1 | grep -q "^${cask}\$"; then
			doUpdate=true;
		else
			brew cask install $cask
    fi
done

#Update any of the packages or casks that were previously installed
if [ doUpdate ]; then
	brew update
fi
