#!/bin/bash

# this script assumes files in ~/ and in git repo aren't too different
cd "$(dirname "$0")"

# copy files from home dir to this dir
cp -f ~/.bash_aliases ./
cp -f ~/.vimrc ./

# push new changes and merge
git add -A
git commit -m "auto-commit"

# pull changes
git pull
git push

# cp new stuff to home dir
cp -f ./.bash_aliases ~/
cp -f ./.vimrc ~/

# source .bash_aliases
source ~/.bash_aliases
