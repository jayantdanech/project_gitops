#!/bin/bash
# Author : Jayant Danech
# Purpose : Deployer
# Create Date : 08.11.2025 | Update Date : -


set -e

env=${1:-dev}

environ() {
    if [[ $env == "prod" ]]; then
        port_info="5004"
    elif [[ $env == "staging" ]]; then
        port_info="5003"
    elif [[ $env == "uat" ]]; then
        port_info="5002"
    elif [[ $env == "dev" ]]; then
        port_info="5001"
    fi

    echo -e "\n** DEPLOYMENT INFORMATION **\nProject Environment:  ${env}\nApp deployed! Visit http://localhost:${port_info}"
}

case $env in
  dev|uat|staging|prod)
    echo "Starting $env environment..."
    docker compose up -d $env
    environ
    ;;
  *)
    echo "Usage: ./scripts/deploy-env.sh [dev|uat|staging|prod]"
    exit 1
    ;;
esac

