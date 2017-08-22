#!/bin/bash
set -e
set -x
rm -rf 2.3.1
mkdir 2.3.1
cd 2.3.1
git init
echo first commit > file1
git add file1
git commit -am file1
echo second commit >> file1
git commit -am file1.1
git log
git checkout HEAD^    # Use the caret character as a parent
git branch -f master
git checkout master
git log
git reflog
git reset --hard HEAD@{1}
git log
cd -
rm -rf 2.3.1
