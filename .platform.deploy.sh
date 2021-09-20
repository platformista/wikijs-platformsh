#!/usr/bin/env bash

DB_HOST=$(echo $PLATFORM_RELATIONSHIPS | base64 --decode | jq -r '.database[0].host')
DB_PORT=$(echo $PLATFORM_RELATIONSHIPS | base64 --decode | jq -r '.database[0].port')
DB_USERNAME=$(echo $PLATFORM_RELATIONSHIPS | base64 --decode | jq -r '.database[0].username')
DB_PASSWORD=$(echo $PLATFORM_RELATIONSHIPS | base64 --decode | jq -r '.database[0].password')
DB_DATABASE=$(echo $PLATFORM_RELATIONSHIPS | base64 --decode | jq -r '.database[0].path')

sed "s|port: 3000|port: $PORT|g" config.sample.yml > config.yml
sed -i "s|host: localhost|host: $DB_HOST|g" config.yml
sed -i "s|port: 5432|port: $DB_PORT|g" config.yml
sed -i "s|pass: wikijsrocks|pass: $DB_PASSWORD|g" config.yml
sed -i "s|user: wikijs|user: $DB_USERNAME|g" config.yml
sed -i "s|db: wiki|db: $DB_DATABASE|g" config.yml
sed -i "s|bindIP: 0.0.0.0|bindIP: 127.0.0.1|g" config.yml
