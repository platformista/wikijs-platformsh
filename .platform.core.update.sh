#!/usr/bin/env bash

CURRENT_VERSION=$(jq -r ".version" package.json)
RELEASE_URL=https://api.github.com/repos/Requarks/wiki/releases/latest
WIKIJS_VERSION=$(curl -s $RELEASE_URL| jq -r '.tag_name')
if [ "$WIKIJS_VERSION" != "$CURRENT_VERSION" ]; then
  echo "export WIKIJS_VERSION='$WIKIJS_VERSION'" > .version
  git commit -m "Updated Wiki.js ($CURRENT_VERSION to $WIKIJS_VERSION)."
fi
