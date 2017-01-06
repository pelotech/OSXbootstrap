#!/usr/bin/env bash

function clone_repo(){
	local home=$1
	local gitName=$2

	#split the github path into it's user and repo parts
	IFS='/' read -r -a array <<< "${gitName}"
	local gitUser=${array[0]}
	local gitRepo=${array[1]}

	#clear existing work and re-create folder structure
	rm -rf "$home/$gitUser/$gitRepo"
	mkdir -p "$home/$gitUser"

	#get a fresh copy
	git clone git@github.com:${gitName}.git -p "$home/$gitUser"

	#return the location of the repo
	return "$home/$gitUser/$gitRepo"
}

function source_files(){
	echo "${1}/*.sh"
	for file in "${1}"/*.sh; do
		echo "Sourcing ${file}"
		source $file
	done;
	unset file;
}

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


function doIt(){
	local doPkgs=$1
	local doPrefs=$2
	local extras=$3

	silence_terminal

	local home="$HOME\Code"
	mkdir -p $home
	local gitDir=clone_repo $home "PelotonTechIO\bootstrapOSX"

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
		gitDir=clone_repo $home $repo
		source_files $gitDir
	done
}




# get flags from the command line
force=false
prefs=true
pkgs=true

while [[ ${1} ]]; do
	#echo $1;
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

if [ $force == false ]; then
	read -p "This will overwrite some of your OSX preferences. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt $pkgs $prefs $extras;
	fi;
else
		doIt $pkgs $prefs $extras;
fi;

unset doIt;
unset prefs;
unset pkgs;
unset extras;
unset force;
