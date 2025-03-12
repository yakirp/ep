# Email to Webhook Service

This repository contains the infrastructure and Lambda functions for the Email to Webhook service.

## Deployment Instructions

### Step 1: Package Lambda Functions

Before deploying, you need to package each Lambda function. Navigate to each Lambda function directory and run the packaging script:

```
./package.sh
```

The packaging script will:

- Install all dependencies specified in requirements.txt
- Package the function code and dependencies into a zip file
- Place the zip file in the root directory of the project

### Step 2: Deploy the Infrastructure

After packaging all Lambda functions, run the deployment script from the root directory:

```
./deploy.sh
```

## Prerequisites

Before you begin, ensure you have the following tools installed:

1. **AWS CLI** - The AWS Command Line Interface is required for authentication and interaction with AWS services.

   ```
   # Install AWS CLI on Linux/macOS
   curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
   unzip awscliv2.zip
   sudo ./aws/install

   # Install AWS CLI on Windows
   # Download the installer from: https://awscli.amazonaws.com/AWSCLIV2.msi
   ```

   Configure AWS CLI with your credentials:

   ```
   aws configure
   ```

2. **Terraform** - Infrastructure as Code tool used to provision and manage AWS resources.

   ```
   # Install Terraform on Linux
   wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
   echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
   sudo apt update && sudo apt install terraform

   # Install Terraform on macOS
   brew tap hashicorp/tap
   brew install hashicorp/tap/terraform

   # Install Terraform on Windows
   # Download from: https://developer.hashicorp.com/terraform/downloads
   ```

   Verify installation:

   ```
   terraform --version
   ```

3. **S3 Bucket for Terraform State** - Create an S3 bucket to store Terraform state files.

   ```
   # Create an S3 bucket for Terraform state
   aws s3 mb s3://my-terraform-state-bucket-name --region us-east-1

   ```

   Then configure your Terraform backend in `provider.tf`:

   ```hcl
   terraform {
     backend "s3" {
       bucket = "my-terraform-state-bucket-name"
       key    = "terraform.tfstate"
       region = "us-east-1"
     }
   }

   provider "aws" {
     region = var.aws_region
   }
   ```

   Make sure to replace `my-terraform-state-bucket-name` with your actual bucket name.
