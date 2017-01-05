#!/usr/bin/env bash


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

#force=  ${force:-false}
#prefs=  ${prefs:-true}
#pkgs=  ${pkgs:-true}

echo "force = $force"
echo "prefs = $prefs"
echo "pkgs = $pkgs"
echo "extras = $extras"

#ARG1=${1:false}
#ARG2=${2:-bar}

#echo $force
#if [ ${force} == true ]; then
#	echo "true"
#else
#	echo "false"
#fi;
#echo $ARG1
#echo $ARG2
