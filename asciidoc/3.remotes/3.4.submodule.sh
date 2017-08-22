#!/bin/bash
set -x
set -e

rm -rf 3.4.1
mkdir -p 3.4.1
cd 3.4.1
rm -rf alicelib && mkdir alicelib && cd alicelib
git init
echo 'A' > file1
git add file1
git commit -am 'A'
git checkout -b experimental      # Branch to experimental
echo 'C - EXPERIMENTAL' >> file1
git commit -am EXPERIMENTAL
git checkout master
echo 'B' >> file1
git commit -am 'B'
cd ..
rm -rf bob_repo && mkdir bob_repo && cd bob_repo
git init
echo 'source alicelib' > file1
git add file1
git commit -am 'sourcing alicelib'
echo 'do something with alicelib experimental' >> file1
git commit -am 'using alicelib experimental'
cat file1
git submodule init
echo git submodule add ../alicelib
git submodule add ../alicelib
ls -a
ls -a alicelib/
cat .gitmodules 
git submodule status
cd alicelib
git branch -a -vv
git checkout experimental
git branch -a -vv
git checkout -b alicemaster --track origin/master
cd ..
git diff
git commit -am 'alicelib moved to experimental'
cd ../alicelib
git checkout experimental
echo 'D' >> file1
git commit -am 'D - a fix added'
cd ../bob_repo/alicelib
git pull
cd ../..
rm -rf bob_repo_cloned
git clone bob_repo bob_repo_cloned
cd bob_repo_cloned
ls -1
cd alicelib
ls ## No output
git submodule status
git submodule init
git submodule update
git submodule status
cd ../..
git clone --recursive bob_repo bob_repo_cloned_recursive
