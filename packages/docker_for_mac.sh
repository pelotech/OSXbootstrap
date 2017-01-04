#!/usr/bin/env bash

###############################################################################
# Docker                                                                      #
###############################################################################

#docker for mac does not have a homebrew cask yet
curl -o Docker.dmg https://download.docker.com/mac/stable/Docker.dmg
hdiutil mount Docker.dmg
cp -R "/Volumes/Docker/Docker.app" /Applications
hdiutil unmount "/Volumes/Docker/"
rm Docker.dmg

#Pull docker images to cache our basics
Docker pull node
Docker pull rethinkdb
Docker pull mongo
Docker pull drone/drone
Docker pull plugins/slack-blame #used by drone
