#!/bin/env bash

# Intended to set up this repository on a new machine, ready for pushing.
set -e
OTHER_REMOTES=("git@git.gay:nex/proof.git" "git@git.nexy7574.co.uk:nex/proof.git" "git@github.com:nexy7574/proof.git")

git remote remove origin || true
git remote add origin git@codeberg.org:nexy7574/proof.git

for url in "${OTHER_REMOTES[@]}"; do
  echo "Adding remote: $url"
  git remote set-url origin --push --add "$url"
done
git fetch origin
