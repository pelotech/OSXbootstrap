#!/usr/bin/env bash

###############################################################################
# install GNU core utilities (those that come with macOS are outdated).
brew install coreutils

export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
