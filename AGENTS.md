# Backend Service (Quotes API)

A simple Go service that serves random quotes via a REST API.

## Project Overview

This is a test component for the Lunar guardrails platform. It's a Go service with a Dockerfile, ArgoCD deployment configs, Terraform infrastructure, and OpenAPI spec.

## Build Commands

```bash
go build -o quotes-api .
go test ./...
```

## Architecture

- `main.go` — HTTP server setup and routing
- `quotes.go` — Quote data and handler logic
- `deploy/` — Kubernetes and Terraform configs
- `argocd/` — ArgoCD application definitions

## Testing

```bash
go test -v -coverprofile=coverage.out ./...
go tool cover -func=coverage.out
```

## Dependencies

Uses standard library only plus `go.mod` for module management. No external frameworks.

## Deployment

Deployed via ArgoCD to Kubernetes. Infrastructure managed with Terraform (EC2, S3, IAM, WAF).
