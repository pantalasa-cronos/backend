---
exercise_type: tabletop
---

# DR Exercise — Database Failover

## Scenario

Simulated complete loss of the primary PostgreSQL database in us-east-1a. Assumed RDS Multi-AZ automatic failover did not trigger due to a networking partition that left the primary in an ambiguous state.

## Recovery Steps Tested

1. Shane detected the outage via PagerDuty alert on 5xx error rate spike (2 min)
2. Confirmed primary DB was unreachable from application pods
3. Checked AWS RDS console — primary showed "storage-full" status, failover not triggered
4. Initiated manual failover via `aws rds reboot-db-instance --force-failover`
5. Waited for DNS propagation to new primary (~3 minutes)
6. Verified application reconnected and queries succeeded
7. Ran integration tests against production to confirm data integrity

## Participants

- Shane (Backend lead, on-call)
- Dave (DBA)
- Kelly (Engineering manager, observer)

## Action Items

- [ ] Add CloudWatch alarm for RDS storage approaching 90% capacity
- [ ] Document the `aws rds reboot-db-instance --force-failover` command in runbook
- [ ] Test connection pool recovery behavior under forced failover
- [ ] Verify PgBouncer reconnect timeout is set to < 30 seconds

## Lessons Learned

- Manual failover took ~8 minutes total vs 60-minute RTO — well within target
- The team was unsure whether force-failover preserves the same endpoint DNS — it does
- PagerDuty alert fired within 2 minutes of first errors — alerting is solid
- Connection pool took 45 seconds to recover after failover — acceptable but worth monitoring
