#!/usr/bin/env bash

curl -sS https://platform.sh/cli/installer | php
curl -sS https://github.com/Requarks/wiki/releases/download/$(cat .version)/wiki-js.tar.gz -O - | tar -xz
ln -s config/config.yml config.yml
