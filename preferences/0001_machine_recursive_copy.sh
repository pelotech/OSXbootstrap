#!/usr/bin/env bash

###############################################################################
# recursively copy directories from the "machine" directory to "/"            #
###############################################################################




dir="$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo "Synching dotfiles from ${DIR}"

startingPWD=$pwd
cd "$dir/machine"

sudo rsync --exclude ".git/" \
  --exclude ".DS_Store" \
  -avh --no-perms "./" "/";

cd $startingPWD
