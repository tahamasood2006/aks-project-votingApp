
#!/bin/bash

set -x

REPO_URL="https://dev.azure.com/Tahamasood/Voting-app-project/_git/Voting-app-project"


echo "Cloning repository..."

git -c http.extraheader="AUTHORIZATION: bearer $SYSTEM_ACCESSTOKEN" \
    clone "$REPO_URL" /tmp/temp_repo


cd /tmp/temp_repo


echo "Updating Kubernetes manifest..."

sed -i "s|image:.*|image: votingregistry.azurecr.io/$2:$3|g" \
    "k8s-specifications/$1-deployment.yaml"


git config user.email "azure-pipelines@dev.azure.com"
git config user.name "Azure Pipelines"


echo "Committing changes..."

git add .

git commit -m "Update Kubernetes manifest"


echo "Pushing changes to main..."

git -c http.extraheader="AUTHORIZATION: bearer $SYSTEM_ACCESSTOKEN" \
    push origin HEAD:main


cd /

rm -rf /tmp/temp_repo

echo "Manifest update completed successfully."

