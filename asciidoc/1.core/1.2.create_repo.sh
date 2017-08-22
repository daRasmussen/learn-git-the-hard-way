#!/bin/bash
set -x
set -e
rm -rf 1.2.1
mkdir 1.2.1
cd 1.2.1
git init
cd .git
ls
cat HEAD
cat config
cd ..
set +e
git log
ls .git/refs/heads/master
set -e
git status
touch mycode.py
git status
git add mycode.py
set +e
git log
set -e
git commit -am '1'
git log
echo change >> mycode.py
git diff
git status
git commit -am '2'
git status
git log
cd ..
rm -rf 1.2.1
