#!/bin/bash
set -x
set -e


rm -rf 3.3.1
mkdir -p 3.3.1
cd 3.3.1
mkdir git_origin
cd git_origin
git init
echo 'first commit' > file1
git add file1
git commit -am file1
cd ..
git clone git_origin git_clone
cd git_origin
git branch -a -v
cd ../git_clone
git branch -a -v
git checkout -b abranch
echo 'cloned abranch commit' >> file1
git commit -am 'cloned abranch commit'
git push origin abranch

cd ..
rm -rf git_origin git_clone
mkdir git_origin
cd git_origin
git init
echo 'first commit' > file1
git add file1
git commit -am file1
cd ..
git clone git_origin git_clone
cd git_clone
git checkout -b abranch
echo 'cloned abranch commit' >> file1
git commit -am 'cloned abranch commit'
cd ../git_origin
git checkout -b abranch
echo 'origin abranch commit' >> file1
git commit -am 'origin abranch commit'
cd ../git_clone
# EXPECT ERROR
#git push origin abranch:abranch
git fetch origin
git branch -v -a
# EXPECT ERROR
#git merge remotes/origin/abranch

cd ..
rm -rf git_origin git_clone
mkdir git_origin
cd git_origin
git init
echo 'first commit' > file1
git add file1
git commit -am file1
cd ..
git clone git_origin git_clone
cd git_origin
git checkout -b abranch
echo 'origin abranch commit' >> file1
git commit -am 'cloned abranch commit'
git branch -a
cd ../git_clone
git branch -a
git remote -v
git fetch origin
git branch -a
git branch
git checkout abranch
git branch -a -vv
git push 

cd ..
rm -rf git_origin git_clone
mkdir git_origin
cd git_origin
git init
echo 'first commit' > file1
git add file1
git commit -am file1
cd ..
git clone git_origin git_clone
cd git_clone
git checkout -b abranch
echo 'origin abranch commit' >> file1
git commit -am 'cloned abranch commit'
# EXPECT ERROR
#git push
git branch -vv
git push --set-upstream origin abranch
git push -u origin abranch
git push origin abranch
git branch -vv
git push -u origin abranch
git branch -vv
