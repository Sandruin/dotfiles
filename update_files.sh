#!/bin/bash

# copy files from home dir to this dir
cp -f ~/.bash_aliases .
cp -f ~/.vimrc .

git add -A
