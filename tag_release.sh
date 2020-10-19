#!/usr/bin/env bash

current_branch=$(git branch --show-current)

git checkout master
git pull
echo

tag=v$(date +%Y.%m.%d)
git tag $tag
git push $(git remote) $tag
echo

git checkout $current_branch
