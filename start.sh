#!/usr/bin/env bash
set -e

# Pull required container images from Docker Hub
docker-compose pull conjur

# Build containers
docker-compose build client ansible

# Remove containers created in earlier runs (if any)
docker-compose down

# Start containers & wait for Conjur to be responsive
docker-compose up -d
docker-compose exec conjur /opt/conjur/evoke/bin/wait_for_conjur

# Prepare the client to connect to the Conjur server
# Initialize the Conjur client
docker-compose exec client bash -c "conjur init -h https://conjur -a cucumber"
