# Deployment Configuration

## Overview

Kubernetes manifests and Terraform infrastructure for the quotes API service.

## Key Files

- `containers.yml` — Pod spec with resource limits
- `hpa.yaml` — Horizontal Pod Autoscaler (min 2, max 10)
- `ingress.yaml` — Ingress rules for external traffic
- `terraform/` — AWS infrastructure (EC2, S3, IAM, WAF)

## Common Tasks

To preview Terraform changes:

```bash
cd terraform && terraform plan
```
