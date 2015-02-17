#!/bin/bash
echo "=== Switch branch to testing ==="
git checkout testing
echo "=== Merge branch with master ==="
git merge master
echo "=== Pushing testing to remote ==="
git push -u origin testing
echo "=== Switch branch to master ==="
git checkout master
