#!/bin/bash

# this script assumes files in $HOME/ and in git repo aren't too different
cd "$(dirname "$0")"

# copy files from home dir to this dir
cp -f $HOME/.bash_aliases ./
cp -f $HOME/.vimrc ./

# push new changes and merge
git add .
git commit -m "auto-commit"

# pull changes
git pull --no-edit
git push

# cp new stuff to home dir
cp -f ./.bash_aliases $HOME/
cp -f ./.vimrc $HOME/

# source .bash_aliases
source $HOME/.bash_aliases
