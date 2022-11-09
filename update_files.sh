#!/bin/bash

# this script assumes files in ~/ and in git repo aren't too different

# pull changes
git pull

# copy files from home dir to this dir
cp -f ~/.bash_aliases ./
cp -f ~/.vimrc ./

# push new changes and merge
git add -A
git commit -m "auto-commit"
git push

# cp new stuff to home dir
cp -f ./.bash_aliases ~/
cp -f ./.vimrc ~/
