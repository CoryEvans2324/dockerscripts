#!/bin/bash

IMAGE=library/postgres:12
CONTAINER_NAME=postgres

POSTGRES_USER=postgres
POSTGRES_PASSWORD=password
POSTGRES_DB=postgres

docker create \
    --name=$CONTAINER_NAME \
    -e POSTGRES_USER=$POSTGRES_USER \
    -e POSTGRES_PASSWORD=$POSTGRES_PASSWORD \
    -e POSTGRES_DB=$POSTGRES_DB \
    -p 5432:5432 \
    $IMAGE

docker start $CONTAINER_NAME
