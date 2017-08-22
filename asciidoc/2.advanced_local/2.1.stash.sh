#!/bin/bash
set -x
set -e
rm -rf 2.1.1
mkdir 2.1.1
cd 2.1.1
git init
echo 'Some content' > file1
git add file1
git commit -am initial
echo 'Some changes I am not sure about' >> file1
git diff
git stash
git status
git log --graph --all --decorate
git stash list
git stash pop
cd ..
rm -rf 2.1.1
rm -rf 2.1.2
mkdir 2.1.2
cd 2.1.2
git init
echo 'Some content' > file1
git add file1
git commit -am initial
echo 'First changes I am not sure about' >> file1
git stash
echo 'Second change I am also not sure about' >> file1
git stash
git stash list
git stash show stash@{0}
git stash show stash@{1}
git stash show --patch stash@{0}
git stash apply stash@{1}
git diff
git stash list
cd ..
rm -rf 2.1.2
