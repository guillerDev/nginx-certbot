#!/bin/bash

if ! [ -x "$(command -v docker-compose)" ]; then
  echo 'Error: docker-compose is not installed.' >&2
  exit 1
fi

while getopts d: option
  do
    case "${option}"
    in
    d) DOMAIN=${OPTARG};;
  esac
done

echo "### Stopping services."
docker-compose stop

echo '### Creating nginx configuration from app.template'
export DOMAIN=$DOMAIN
envsubst \$DOMAIN < ./data/nginx/app.template > ./data/nginx/app.conf;
