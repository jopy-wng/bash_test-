#!/bin/bash
set -e

cloneurl=$(git remote -v | grep fetch | awk '{print $2}' | head -n 1)

if [ -z "$cloneurl" ]; then
    echo "No remote URL found. Add a remote using 'git remote add origin <URL>'"
    exit 1
fi

echo "Remote URL found: $cloneurl"

parentdir=$(dirname "$PWD")

clonename="repo-test-clone"

echo "Cloning repo into $parentdir/$clonename..."
git clone "$cloneurl" "$parentdir/$clonename"

cd "$parentdir/$clonename"

echo "Compiling..."
if make compile ; then
    echo "Compilation succeeded. Running program..."
    make run
else
    echo "failed to compile"
fi

echo "Cleaning up..."
cd "$parentdir"
rm -rf "$clonename"

echo "Done."
