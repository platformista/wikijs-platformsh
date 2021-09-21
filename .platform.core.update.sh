#!/usr/bin/env bash

RELEASE_URL=https://api.github.com/repos/Requarks/wiki/releases/latest
CURRENT_VERSION=$(cat .version)
LATEST_VERSION=$(curl -s $RELEASE_URL| jq -r '.tag_name')
if [ "$LATEST_VERSION" != "$CURRENT_VERSION" ]; then
  echo $LATEST_VERSION > .version
  git add .version
  git commit -m "Updated Wiki.js ($CURRENT_VERSION to $LATEST_VERSION)."
else
  echo "No core updates found. Wiki.js remains on version $CURRENT_VERSION"
fi
