#!/usr/bin/env bash
set -e

BRANCH_NAME="main"

# Ensure you're on the correct branch
git checkout "${BRANCH_NAME}"
git pull origin "${BRANCH_NAME}"

# Install Python dependencies
pip install -r requirements.txt

# Bootstrap CDK
cdk bootstrap aws://851725206270/us-east-2 \
  --cloudformation-execution-policies arn:aws:iam::aws:policy/AdministratorAccess \
  --force \
  --toolkit-stack-name CDKToolkit

# Synthesize and deploy
cdk synth
cdk deploy --require-approval never
