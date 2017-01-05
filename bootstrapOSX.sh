#!/usr/bin/env bash


#echo $(dirname ${BASH_SOURCE})
#echo "Bash_Source ${BASH_SOURCE[0]}"
cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

function boot_repo(){
	echo "booting repo $1"
}

function sourceFiles(){

	for file in ~/{$1}/*; do
		echo $file
		source $file
	done;
	unset file;

}

function doIt(){
	local doPkgs={$1}
	local doPrefs={$2}
	local extras={$3}

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


		if [ $doPkgs ]; then
			sourceFiles "packages"
		fi;

		if [ $doPrefs ]; then
			sourceFiles "preferences"
		fi;

		IFS=', ' read -r -a array <<< "$extras"
		for repo in "${array[@]}"
		do
    	echo "$repo"
			boot_repo $repo
		done
}


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
										exit 1
								fi
								;;
            *)
                echo "Unknown parameter: ${1}" >&2
                exit 1
        esac
    done


if [ $force == false ]; then
	read -p "This will overwrite some of your OSX preferences. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt pkgs prefs extras;
	fi;
else
		doIt pkgs prefs extras;
fi;
unset doIt;
