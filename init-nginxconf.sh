#!/bin/bash

if ! [ -x "$(command -v docker-compose)" ]; then
  echo 'Error: docker-compose is not installed.' >&2
  exit 1
fi

while getopts d:c:y: option
  do
    case "${option}"
    in
    d) DOMAIN=${OPTARG};;
    c) CONF_PATH=${OPTARG};;
    y) YML_PATH=${OPTARG};;
  esac
done


echo "### Stopping services."
docker-compose stop

echo "### Saving old nginx conf."
mv -r ./data/nginx ./data/nginx-OLD

echo '### Creating nginx configuration from app.template'
cp -r CONF_PATH ./data/nginx
export DOMAIN=$DOMAIN
envsubst \$DOMAIN < ./data/nginx/app.template > ./data/nginx/app.conf;

echo "### Starting services."
docker-compose -f docker-compose.override.yml -f $YML_PATH up -d
