# Plan: Add Health Check Endpoint

Add `/healthz` and `/readyz` endpoints for Kubernetes probes.

## Steps

1. Add handler functions in `main.go`
2. `/healthz` — always returns 200 (liveness)
3. `/readyz` — checks DB connectivity (readiness)
4. Update deployment YAML with probe configuration
