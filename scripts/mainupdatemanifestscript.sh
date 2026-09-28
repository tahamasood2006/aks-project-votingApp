#!/bin/bash

set -x

REPO_URL="https://dev.azure.com/Tahamasood/Voting-app-project/_git/Voting-app-project"

git -c http.extraheader="AUTHORIZATION: bearer $(System.AccessToken)" \
    clone "$REPO_URL" /tmp/temp_repo

cd /tmp/temp_repo

sed -i "s|image:.*|image: votingregistry.azurecr.io/$2:$3|g" \
    "k8s-specifications/$1-deployment.yaml"

git add .

git commit -m "Update Kubernetes manifest"

git -c http.extraheader="AUTHORIZATION: bearer $(System.AccessToken)" \
    push

rm -rf /tmp/temp_repo