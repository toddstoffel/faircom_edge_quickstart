#!/bin/bash

# FairCom Edge Sample Data Creation Script
# This script runs the Python data generator inside the Docker container

set -e

CONTAINER_NAME="faircom-edge"

echo "========================================"
echo "FairCom Edge Sample Data Creator"
echo "========================================"
echo ""

# Check if container is running
if ! docker ps --format '{{.Names}}' | grep -q "^${CONTAINER_NAME}$"; then
    echo "❌ Error: Container '${CONTAINER_NAME}' is not running"
    echo "Please start the container first with:"
    echo "  ./faircom_quick_start.sh start"
    exit 1
fi

echo "✓ Container '${CONTAINER_NAME}' is running"
echo ""

# Run the Python script inside the container
docker exec -w /opt/faircom/server ${CONTAINER_NAME} python3 /usr/local/bin/create_sample_data.py

exit $?
