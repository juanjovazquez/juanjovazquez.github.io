#!/bin/bash
shopt -s extglob

function error_exit
{
    echo "$1" 1>&2
    exit 1
}

# Check if commit message argument
if [ -z "$1" ]
then
  echo "deploy script error: What changes did you make? Type a commit message."
  exit 1
fi
 
# Build successfuly or exit
stack clean
stack build || error\_exit "deploy script error: Build failed"
 
# Push changes on master branch to github
git add -A
git commit -m "$1" || error\_exit "deploy script error: no changes to commit"
git push origin master
 
# Switch to master branch
git checkout gh-pages
 
# delete old site
rm -rf !(CNAME|.gitignore) # dont delete CNAME and README.md
git add -A && git commit -m "delete old site"
 
# switch to hakyll branch and rebuild website
git checkout master
stack exec site rebuild
 
# switch to master, extract site and push
git checkout gh-pages
mv _site/* .
git add -A && git commit --amend --allow-empty -m "$1"
git push origin gh-pages
 
# return to original branch
git checkout master
