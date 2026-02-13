---
rto_minutes: 60
rpo_minutes: 15
last_reviewed: 2025-01-10
approver: shane@pantalasa.org
---

# Disaster Recovery Plan

## Overview

The backend service is a Go HTTP API serving quotes. It runs on Kubernetes in us-east-1 with PostgreSQL (RDS Multi-AZ) as the primary datastore and Redis (ElastiCache) for caching.

## Recovery Steps

1. Confirm the scope of the outage (single pod, node, AZ, or region)
2. Check PagerDuty for correlated alerts across dependent services
3. If database is unreachable, verify RDS failover status in AWS console
4. If RDS failover did not trigger, initiate manual failover via AWS CLI
5. Scale up pods in healthy AZ if capacity is reduced
6. Verify data integrity by running `go test ./... -tags=integration`
7. Monitor error rates for 30 minutes post-recovery

## Contact List

- Primary on-call: Shane (shane@pantalasa.org)
- Engineering manager: Kelly (kelly@pantalasa.org)
- DBA: Dave (dave@pantalasa.org)
- VP Engineering: Robert (robert@pantalasa.org)

## Dependencies

- PostgreSQL 15 (RDS Multi-AZ, us-east-1)
- Redis 7 (ElastiCache, us-east-1)
- ArgoCD for deployments
- GitHub Actions for CI

## Communication Plan

- Page on-call via PagerDuty
- Post in #incident-backend Slack channel
- Update status page if customer-facing impact exceeds 5 minutes
