#!/bin/bash
set -e
env=${1:-development}
version=${2:-latest}

echo "Deploying to $env environment (version $version)..."

export APP_ENV=$env
export APP_VERSION=$version

docker compose down
docker compose up --build -d

echo "App deployed! Visit http://localhost:5000"

