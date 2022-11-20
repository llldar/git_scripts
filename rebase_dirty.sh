#!/bin/bash

TARGET_BRANCH="main"
SOURCE_BRANCH=`git branch | grep \* | cut -d ' ' -f2`

git add -A
git stash save temp
git checkout $TARGET_BRANCH
git pull
git checkout $SOURCE_BRANCH
git rebase $TARGET_BRANCH
git stash pop 0
git reset