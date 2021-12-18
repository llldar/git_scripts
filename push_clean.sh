#!/bin/bash

TARGET_BRANCH="master"
LATEST_COMMIT=`echo $(git log --pretty=format:'%h' -n 1)`
SOURCE_BRANCH=`git branch | grep \* | cut -d ' ' -f2`

git checkout $TARGET_BRANCH
git cherry-pick $LATEST_COMMIT
git push origin HEAD:refs/for/$TARGET_BRANCH
git reset --hard HEAD~1
git checkout $SOURCE_BRANCH