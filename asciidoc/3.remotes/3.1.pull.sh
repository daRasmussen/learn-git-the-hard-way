#!/bin/bash
set -x
set -e

rm -rf 3.1.1
mkdir 3.1.1
cd 3.1.1
mkdir git_origin
cd git_origin
git init
echo 'first commit' > file1
git add file1
git commit -am file1
cd ..
git clone git_origin git_cloned
diff git_origin/file1 git_cloned/file1
cat git_origin/.git/config
cat git_cloned/.git/config
cd git_cloned
git remote
git remote -v
git remote -v
cd ..
cd git_origin
echo 'fetchable change' >> file1
git commit -am fetchable
cd ../git_cloned
git fetch origin master
git branch --all
ls .git/refs/
cat .git/refs/heads/master
cat .git/refs/remotes/origin/master 
git merge origin/master
cd ../..
rm -rf 3.1.1
