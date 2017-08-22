#!/bin/bash
set -x
set -e

rm -rf 2.6.1
mkdir -p 2.6.1
cd 2.6.1
git init
touch projectfile
git add projectfile
for ((i=1;i<=100;i++)); do echo $i >> projectfile; git commit -am "A$i"; done
git log
git bisect start
git bisect bad
git status
git checkout HEAD~99   # Check out the first checkout
git log
git status
git bisect good
git log                # Now at A50
git status
git bisect good        
git log                # Now at A75
git bisect bad         
git log                # Now at A62
git bisect good        
git log                # Now at A68
git bisect bad         
git log                # Now at A65
git bisect bad        
git log                # Now at A64
git bisect bad         
git log                # Now at A63
git bisect bad
cd ..
rm -rf 2.6.1
