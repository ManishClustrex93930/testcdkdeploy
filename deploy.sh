#!/usr/bin/env bash
set -e

# Get the GitHub PAT from environment variable
GITHUB_PAT="$GITHUB_PAT"

# Validate that GITHUB_PAT is set
if [ -z "$GITHUB_PAT" ]; then
  echo "Error: GITHUB_PAT environment variable not set."
  exit 1
fi

REPO_URL="https://${GITHUB_PAT}@github.com/ManishClustrex93930/testcdkdeploy.git"
BRANCH="main"

# Remove old clone if exists
rm -rf cdk-app

# Clone the repo and switch to it
git clone --branch "$BRANCH" "$REPO_URL" cdk-app
cd cdk-app

pip install -r requirements.txt

# Bootstrap the environment
cdk bootstrap aws://851725206270/us-east-2 --cloudformation-execution-policies arn:aws:iam::aws:policy/AdministratorAccess --force --toolkit-stack-name CDKToolkit


# Synthesize CloudFormation templates
cdk synth

# Deploy the stack without approval prompts
cdk deploy --require-approval never
