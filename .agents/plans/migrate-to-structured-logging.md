# Plan: Migrate to Structured Logging

Replace `log.Printf` calls with `slog` structured logging throughout the service.

## Steps

1. Add `log/slog` import
2. Replace `log.Printf` with `slog.Info` / `slog.Error`
3. Add context fields (request_id, user_id) to log entries
4. Update tests
