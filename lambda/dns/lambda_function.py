import boto3
import json

ses_client = boto3.client('ses')
aws_region = "us-east-1"  # Replace with your AWS region

def lambda_handler(event, context):
    try:
        # Parse the user-provided domain from the event
        body = json.loads(event['body'])
        user_domain = body.get('domain')

        if not user_domain:
            return {
                "statusCode": 400,
                "body": json.dumps({"error": "Domain is required"})
            }

        # Step 1: Verify the domain in SES
        verify_response = ses_client.verify_domain_identity(Domain=user_domain)
        verification_token = verify_response["VerificationToken"]

        # Step 2: Generate DNS records for the user
        dns_records = {
            "MX": {
                "Type": "MX",
                "Name": user_domain,
                "Value": f"10 inbound-smtp.us-east-1.amazonaws.com"
            },
            "Verification": {
                "Type": "TXT",
                "Name": f"_amazonses.{user_domain}",
                "Value": verification_token
            }
        }

        # Step 3: Return DNS records to the user
        return {
            "statusCode": 200,
            "body": json.dumps({
                "message": "Domain verification initiated.",
                "dns_records": dns_records
            })
        }

    except Exception as e:
        return {
            "statusCode": 500,
            "body": json.dumps({"error": str(e)})
        }
