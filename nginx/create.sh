#!/bin/bash

# IMAGE=linuxserver/letsencrypt:latest
IMAGE=linuxserver/swag:latest
CONTAINER_NAME=nginx
DOMAIN=corye.me

STAGING=true

WORK_DIR=$(pwd)
config_dir="$WORK_DIR/config"

[ ! -d $config_dir ] && mkdir -p $config_dir

docker create \
    --name=$CONTAINER_NAME \
    --cap-add=NET_ADMIN \
    -e PUID=1000 \
    -e PGID=1000 \
    -e TZ=Pacific/Auckland \
    -e URL=$DOMAIN \
    -e SUBDOMAINS=www, \
    -e VALIDATION=http \
    -e STAGING=$STAGING \
    -p 443:443 \
    -p 80:80 \
    -v $config_dir:/config \
    --restart unless-stopped \
    $IMAGE

docker start $CONTAINER_NAME
