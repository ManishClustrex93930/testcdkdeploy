#!/bin/bash
set -e

# Get the GitHub PAT from environment variable
GITHUB_PAT="$GITHUB_PAT"

# Validate that GITHUB_PAT is set
if [ -z "$GITHUB_PAT" ]; then
  echo "Error: GITHUB_PAT environment variable not set."
  exit 1
fi

# Configure variables
REPO_URL="https://${GITHUB_PAT}@github.com/ManishClustrex93930/testcdkdeploy.git"
BRANCH="main"

# Clone the repo and switch to it
git clone --branch "$BRANCH" "$REPO_URL" cdk-app
cd cdk-app

# Install Python dependencies
pip install -r requirements.txt

# Bootstrap if needed (optional)
cdk bootstrap || true

# Deploy with CDK
cdk deploy --require-approval never
