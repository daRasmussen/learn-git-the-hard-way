rm -rf 1.5.1
mkdir -p 1.5.1
cd 1.5.1
git init
echo A > file1
git add file1
git commit -am 'A'
echo B >> file1
git commit -am 'B'
echo C >> file1
git commit -am 'C'
git branch experimental
git checkout experimental
git branch
echo E >> file1
git commit -am 'E'
echo H >> file1
git commit -am 'H'
git checkout master
git branch
echo D >> file1
git commit -am 'D'
echo F >> file1
git commit -am 'F'
echo G >> file1
git commit -am 'G'
git merge experimental
echo ******************************************
echo resolve conflicts, then
echo git commit -am 'merged experimental in'
echo git log --all --oneline --graph --decorate
echo rm -rf 1.5.1
echo ******************************************
