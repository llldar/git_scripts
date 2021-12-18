#!/bin/bash

TARGET_BRANCH="master"
SOURCE_BRANCH=`git branch | grep \* | cut -d ' ' -f2`

git checkout $TARGET_BRANCH
git pull
git checkout $SOURCE_BRANCH
git merge $TARGET_BRANCH