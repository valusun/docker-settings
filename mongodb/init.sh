#!/bin/bash

echo "Initializing MongoDB replica set..."

# read .env
if [ -f /docker-entrypoint-initdb.d/.env ]; then
  . /docker-entrypoint-initdb.d/.env
fi

# update packages
apt-get update

# replicaset
mongosh --host mongo-primary --username ${MONGO_INITDB_ROOT_USERNAME} --password ${MONGO_INITDB_ROOT_PASSWORD} --authenticationDatabase ${MONGO_AUTH_DB} --eval "rs.initiate({
  _id: "${MONGO_REPLICA_SET_NAME}",
  members: [
    { _id: 0, host: "mongo-primary:${MONGO_PRIMARY_PORT}" },
    { _id: 1, host: "mongo-secondary1:${MONGO_SECONDARY1_PORT}" },
    { _id: 2, host: "mongo-secondary2:${MONGO_SECONDARY2_PORT}" },
    { _id: 3, host: "mongo-arbiter:${MONGO_ARBITER_PORT}", arbiterOnly: true }
  ]
})"

echo "MongoDB replica set initialized."
