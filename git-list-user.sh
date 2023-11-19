#!/bin/bash

# GitHub API URL
API_URL="https://api.github.com"

# GitHub username and personal access token
USERNAME=$username
TOKEN=$token

# User and Repository information
REPO_OWNER=$1
REPO_NAME=$2

# Function to make a GET request to the GitHub API
function github_api_get {
    local endpoint="$1"
    local url="${API_URL}/${endpoint}"

    # Send a GET request to the GitHub API with authentication
    curl -s -u "${USERNAME}:${TOKEN}" "$url"
}

# Function to list users with read access to the repository
function list_users_with_read_access {
    local endpoint="repos/${REPO_OWNER}/${REPO_NAME}/collaborators"

    # Fetch the list of collaborators on the repository
    collaborators="$(github_api_get "$endpoint" | jq -r '.[] | select(.permissions.pull == true) | .login')"

    # Display the list of collaborators with read access
    if [[ -z "$collaborators" ]]; then
        echo "No users with read access found for ${REPO_OWNER}/${REPO_NAME}."
    else
        echo "Users with read access to ${REPO_OWNER}/${REPO_NAME}:"
        echo "$collaborators"
    fi
}

# Main script

echo "Listing users with read access to ${REPO_OWNER}/${REPO_NAME}..."
list_users_with_read_access


====================================================================================
export username="praveenkdevops"
export token="ghp_erfefregbvdedededededededededededed"
clone above script and give the permission as per the below
ubuntu@jenkins:~$ chmod 755 git-list-user.sh
ubuntu@jenkins:~$ ./git-list-user.sh praveenkdevops Srcipting
Listing users with read access to praveenkdevops/Srcipting...
Users with read access to praveenkdevops/Srcipting:
praveenkdevops
=======================if want to execute to another project then change only project name and repo name and execute=============================================================

ref doc:----https://docs.github.com/en/rest/issues/issues?apiVersion=2022-11-28
