#!/bin/bash
set -e

env=${1:-dev}

case $env in
  dev|uat|staging|prod)
    echo "Starting $env environment..."
    docker compose up -d $env
    ;;
  *)
    echo "Usage: ./scripts/deploy-env.sh [dev|uat|staging|prod]"
    exit 1
    ;;
esac

