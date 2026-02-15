# Terraform Infrastructure

## Overview

AWS infrastructure for the quotes API. Managed via Terraform with remote state in S3.

## Resources

- EC2 instances for the API servers
- S3 bucket for static assets and state
- IAM roles and policies for service access
- WAF rules for request filtering

## Applying Changes

Always run `terraform plan` first and review the diff before applying.
