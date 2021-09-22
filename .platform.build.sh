#!/usr/bin/env bash

curl -sS https://platform.sh/cli/installer | php
curl -sSL https://github.com/Requarks/wiki/releases/download/$(cat .version)/wiki-js.tar.gz | tar -xz
ln -s config/config.yml config.yml
