#!/bin/bash

POSTGRES_USER=postgres
POSTGRES_PASSWORD=password
POSTGRES_DB=postgres

CONTAINER_NAME=postgres

docker create \
    --name=$CONTAINER_NAME \
    -e POSTGRES_USER=$POSTGRES_USER \
    -e POSTGRES_PASSWORD=$POSTGRES_PASSWORD \
    -e POSTGRES_DB=$POSTGRES_DB \
    -p 5432:5432 \
    library/postgres:12

docker start $CONTAINER_NAME
