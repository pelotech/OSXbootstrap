#!/usr/bin/env bash

################################################################################
# Clone a git hub repo to a clean location following the tree structure of     #
#
# $HOME
#   -- Code
#        -- [github org/user name]
#            -- [github repo name]
################################################################################
function clone_repo(){

	local codeDir=$1
	local gitName=$2

	#clear existing work and re-create folder structure
	rm -rf "$codeDir/$gitName"
	mkdir -p "$codeDir/$gitName"

	#get a fresh copy
	git clone git@github.com:${gitName}.git "$codeDir/$gitName"

	#return the location of the repo
	echo "$codeDir/$gitName"
}

################################################################################
# Execute .sh files within a directory                                         #
################################################################################
function source_files(){
	for file in "${1}"/*.sh; do
		echo "Sourcing ${file}"
		source $file
	done;
	unset file;
}


################################################################################
# Remove roadblocks for unattended execution                                   #
################################################################################
function silence_terminal(){
		# Close any open System Preferences panes, to prevent them from overriding
		# settings we’re about to change
		osascript -e 'tell application "System Preferences" to quit'

		# Ask for the administrator password upfront
		sudo -v

		# Keep-alive: update existing `sudo` time stamp until `faster_osx.sh` has finished
		while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

		# Set standby delay to 24 hours (default is 1 hour)
		sudo pmset -a standbydelay 86400
}

################################################################################
# Bootstrap OSX with sane defaults for software development                    #
################################################################################
function bootstrap(){
	local doPkgs=$1
	local doPrefs=$2
	local extras=$3

	silence_terminal

	local codeDir="$HOME/Code"
	mkdir -p $codeDir
	local gitDir=$(clone_repo $codeDir "PelotonTechIO/bootstrapOSX")

	if $doPkgs ; then
		sourceFiles "${gitDir}/packages"
	else
		echo "No packages being installed."
	fi;

	if $doPrefs ; then
		sourceFiles "${gitDir}/preferences"
	else
		echo "No preferences being installed."
	fi;

	IFS=',' read -r -a array <<< "$extras"
	for repo in "${array[@]}"
	do
		source_files $(clone_repo $codeDir $repo)
	done
}


################################################################################
# Parse command line and set exectuion flags
################################################################################
force=false
prefs=true
pkgs=true

while [[ ${1} ]]; do
  case "${1}" in
      --force)
          force=true
          shift
          ;;
      --f)
          force=true
          shift
          ;;
			--noprefs)
					prefs=false
					shift
					;;
			--nopkgs)
					pkgs=false
					shift
					;;
			--extras)
					extras=${2}
					shift

					if ! shift; then
							echo 'Missing extras parameter argument.' >&2
							exit 0
					fi
					;;
      *)
          echo "Unknown parameter: ${1}" >&2
          exit 0
  esac
done


################################################################################
# Inovke Execution                                                             #
################################################################################

#execution changes the path, so store the starting point to go back at the end
startingPWD=$pwd

if [ $force == false ]; then
	read -p "This will overwrite some of your OSX preferences. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		bootstrap $pkgs $prefs $extras;
	fi;
else
		bootstrap $pkgs $prefs $extras;
fi;

#return to the starting path
cd $startingPWD

unset bootstrap;
unset prefs;
unset pkgs;
unset extras;
unset force;
