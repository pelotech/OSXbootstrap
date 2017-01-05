#!/usr/bin/env bash



function boot_repo(){
	echo "booting repo $2 into directory $1"
	IFS='/' read -r -a array <<< "${2}"
	local originDir=${array[1]}
	rm -rf ${originDir}
	git clone git@github.com:${2}.git
	sourceFiles $1 $originDir
	#delete the dir that if we commit changes to the source code of the main
	#repo  we aren't also checking in sub-directories of code from the 'Extras'
	rm -rf ${originDir}
}

function sourceFiles(){
	echo "${1}/${2}/*.sh"
	for file in "${1}/${2}"/*.sh; do
		echo "Sourcing ${file}"
		source $file
	done;
	unset file;
}

function doIt(){
	local dir=$1
	local doPkgs=$2
	local doPrefs=$3
	local extras=$4


	# Close any open System Preferences panes, to prevent them from overriding
	# settings we’re about to change
	osascript -e 'tell application "System Preferences" to quit'

	# Ask for the administrator password upfront
	sudo -v

	# Keep-alive: update existing `sudo` time stamp until `faster_osx.sh` has finished
	while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

	# Set standby delay to 24 hours (default is 1 hour)
	sudo pmset -a standbydelay 86400

	if $doPkgs ; then
		sourceFiles $dir "packages"
	else
		echo "No packages being installed."
	fi;

	if $doPrefs ; then
		sourceFiles $dir "preferences"
	else
		echo "No preferences being installed."
	fi;

	IFS=',' read -r -a array <<< "$extras"
	for repo in "${array[@]}"
	do
		boot_repo $dir $repo
	done
}



#navigate through symlinks to get the directory of the script that is running
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  TARGET="$(readlink "$SOURCE")"
  if [[ $TARGET == /* ]]; then
    #echo "SOURCE '$SOURCE' is an absolute symlink to '$TARGET'"
    SOURCE="$TARGET"
  else
    DIR="$( dirname "$SOURCE" )"
    #echo "SOURCE '$SOURCE' is a relative symlink to '$TARGET' (relative to '$DIR')"
    SOURCE="$DIR/$TARGET" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
  fi
done
RDIR="$( dirname "$SOURCE" )"
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
#if [ "$DIR" != "$RDIR" ]; then
#  echo "DIR '$RDIR' resolves to '$DIR'"
#fi

#if we were in a symlink navigate to the resoling location
cd "${DIR}"
git pull origin master;

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
		doIt $DIR $pkgs $prefs $extras;
	fi;
else
		doIt $DIR $pkgs $prefs $extras;
fi;
unset doIt;
unset prefs;
unset pkgs;
unset extras;
unset force;
