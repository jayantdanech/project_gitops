#!/bin/bash
# Author : Jayant Danech
# Purpose : Deployer
# Create Date : 08.11.2025 | Update Date : -


set -e

env=${1:-dev}

gitrepo () {

    gitBranch=$(git branch --show-current)
    if [[ $gitBranch == "$project_branch" ]]; then
        echo -e "Project Branch is Okay"
    else
        echo -e "Project Branch is Okay $gitBranch (required $project_branch)\nSwitching to $project_branch ..."
        git checkout $project_branch
        git pull
    fi

}

environ() {
    if [[ $env == "prod" ]]; then
        port_info="5004"
        project_branch='main'
    elif [[ $env == "staging" ]]; then
        port_info="5003"
        project_branch='staging'
    elif [[ $env == "uat" ]]; then
        port_info="5002"
        project_branch='uat'
    elif [[ $env == "dev" ]]; then
        port_info="5001"
        project_branch='develop'
    fi

    echo -e "\n** DEPLOYMENT INFORMATION **\nProject Environment:  ${env}\nApp deployed! Visit http://localhost:${port_info}"
    gitrepo
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
