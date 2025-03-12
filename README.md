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
