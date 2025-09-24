#!/bin/bash
set -e

cloneurl=$(git remote -v | grep fetch | awk '{print $2}' | head -n 1)
parentdir=$(dirname "$PWD")
clonename="repo-test-clone"

git clone "$cloneurl" "$parentdir/$clonename"
cd "$parentdir/$clonename"

if make compile ; then
    make run
else
    echo "failed to compile"
fi

cd "$parentdir"
rm -rf "$clonename"
