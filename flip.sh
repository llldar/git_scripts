#!/bin/bash

SOURCE_BRANCH=`git branch | grep \* | cut -d ' ' -f2`
TOP_COMMIT=`git rev-parse --short HEAD`
MID_COMMIT=`git rev-parse --short HEAD~1`
TEMP_BRANCH='FlipBranch'

git checkout -b $TEMP_BRANCH
git reset --hard HEAD~2
git cherry-pick $TOP_COMMIT
git cherry-pick $MID_COMMIT
git branch -D $SOURCE_BRANCH
git checkout -b $SOURCE_BRANCH
git branch -D $TEMP_BRANCH