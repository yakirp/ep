#!/bin/bash
# MIT License
# Copyright (c) 2023 [Your Name or Organization]
# See LICENSE file for details

# Define variables
TF_COMMAND="terraform"


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
