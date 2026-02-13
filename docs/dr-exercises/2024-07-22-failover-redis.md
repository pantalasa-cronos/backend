---
exercise_type: failover
---

# DR Exercise — Redis Failover

## Scenario

Actual failover test of the Redis ElastiCache cluster. Triggered a manual failover of the primary node to validate that the application gracefully degrades when the cache is unavailable.

## Recovery Steps Tested

1. Triggered ElastiCache failover via AWS console
2. Observed application behavior during ~30 second cache unavailability window
3. Confirmed application fell back to direct database queries (graceful degradation)
4. Verified cache repopulated automatically after new primary came online
5. Monitored latency impact — p99 increased from 50ms to 200ms during degradation

## Participants

- Shane (Backend lead)
- Danielle (SRE)

## Lessons Learned

- Application handled cache miss gracefully — no errors returned to clients
- Latency impact was acceptable (4x increase during 30s window)
- Cache warm-up took about 5 minutes to return to baseline latency
