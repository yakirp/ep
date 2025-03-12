#!/bin/bash
# MIT License
# Copyright (c) 2023 [Your Name or Organization]
# See LICENSE file for details

# Define variables
TF_COMMAND="terraform"

# Step 1: Package Lambda functions
echo "Packaging Lambda functions..."

echo "Packaging DNS Lambda function..."
(cd lambda/dns && ./package.sh) || {
  echo "DNS Lambda packaging failed."
  exit 1
}

echo "Packaging Check Lambda function..."
(cd lambda/check && ./package.sh) || {
  echo "Check Lambda packaging failed."
  exit 1
}

echo "Packaging Parser Lambda function..."
(cd lambda/parser && ./package.sh) || {
  echo "Parser Lambda packaging failed."
  exit 1
}

# Step 3: Initialize Terraform
echo "Initializing Terraform..."
$TF_COMMAND init || {
  echo "Terraform initialization failed."
  exit 1
}

# Step 4: Run Terraform plan
echo "Running Terraform plan..."
$TF_COMMAND plan || {
  echo "Terraform plan failed."
  exit 1
}

# Step 5: Apply Terraform configuration
echo "Applying Terraform configuration..."
$TF_COMMAND apply -auto-approve || {
  echo "Terraform apply failed."
  exit 1
}

echo "Deployment complete."
