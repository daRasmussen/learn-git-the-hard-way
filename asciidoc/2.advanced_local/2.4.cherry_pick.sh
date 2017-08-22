#!/bin/bash
set -e
set -x
rm -rf 2.4.1
mkdir 2.4.1
cd 2.4.1
git init
echo change1 > file1
git add file1
git commit -am change1
echo change2 >> file1
git commit -am change2
git log
git branch experimental
git checkout experimental
ex -sc '1i|crazy change' -cx file1  # Magic to insert before the first line
cat file1
git commit -am crazy
echo more sensible change >> file1
cat file1
git commit -am sensible
git log

git checkout master
#git cherry-pick ID TODO
cd -
rm -rf 2.4.1
rm -rf 2.4.3
mkdir 2.4.3
cd 2.4.3
git init
echo change1 > file1
git add file1
git commit -am change1
echo change2 >> file1
git commit -am change2
git log
git branch experimental
git checkout experimental
echo crazy change >> file1
cat file1
git commit -am crazy
echo more sensible change >> file1
cat file1
git commit -am sensible
git log
git checkout master
#git cherry-pick ID TODO
git status
cd -
rm -rf 2.4.3
