#!/bin/bash
set -euo pipefail

# Run tests with coverage
echo "Running tests..."

COVERAGE_DIR="./coverage"
mkdir -p "$COVERAGE_DIR"

go test -v -race -coverprofile="${COVERAGE_DIR}/coverage.out" ./...
go tool cover -html="${COVERAGE_DIR}/coverage.out" -o "${COVERAGE_DIR}/coverage.html"

COVERAGE=$(go tool cover -func="${COVERAGE_DIR}/coverage.out" | grep total | awk '{print $3}')
echo "Total coverage: ${COVERAGE}"
