#!/bin/bash
set -x
set -e
rm -rf 3.2.1
mkdir -p 3.2.1
cd 3.2.1
mkdir git_origin
cd git_origin
git init
echo 'first commit' > file1
git add file1
git commit -am file1
cd ..
git clone git_origin alice_cloned
git clone git_origin bob_cloned
cd alice_cloned
git remote -v
cd ../bob_cloned
git remote -v
echo alice_change >> file1 
git remote add alice ../alice_cloned
git remote -v
git fetch alice master
git branch -vv -a
git merge alice/master
cat file1 
git merge remotes/alice/master
cd ../..
rm -rf 3.2.1
