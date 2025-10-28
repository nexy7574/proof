#!/bin/env bash

# Intended to set up this repository on a new machine, ready for pushing.
set -e
OTHER_REMOTES=("ssh://git@git.gay/nex/proof.git" "ssh://git@codeberg.org/timedout/proof.git" "ssh://git@github.com/nexy7574/proof.git")

git remote remove origin || true
git remote add origin ssh://git@git.nexy7574.co.uk:222/nex/proof.git

for url in "${OTHER_REMOTES[@]}"; do
  echo "Adding remote: $url"
  git remote set-url origin --push --add "$url"
done
git fetch origin
