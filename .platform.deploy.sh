#!/usr/bin/env bash

DB_HOST=$(echo $PLATFORM_RELATIONSHIPS | base64 --decode | jq -r '.database[0].host')
DB_PORT=$(echo $PLATFORM_RELATIONSHIPS | base64 --decode | jq -r '.database[0].port')
DB_USERNAME=$(echo $PLATFORM_RELATIONSHIPS | base64 --decode | jq -r '.database[0].username')
DB_PASSWORD=$(echo $PLATFORM_RELATIONSHIPS | base64 --decode | jq -r '.database[0].password')
DB_DATABASE=$(echo $PLATFORM_RELATIONSHIPS | base64 --decode | jq -r '.database[0].path')
BIND_IP="127.0.0.1"

sed "
  s|port: 3000|port: $PORT|g
  s|host: localhost|host: $DB_HOST|g
  s|port: 5432|port: $DB_PORT|g
  s|pass: wikijsrocks|pass: $DB_PASSWORD|g
  s|user: wikijs|user: $DB_USERNAME|g
  s|db: wiki|db: $DB_DATABASE|g
  s|bindIP: 0.0.0.0|bindIP: $BIND_IP|g
  " config.sample.yml > config/config.yml
