#!/bin/bash
set -euo pipefail

# Build the Go backend service
echo "Building backend service..."

BINARY_NAME="go-server"
BUILD_DIR="./bin"

mkdir -p "$BUILD_DIR"

go mod download
go build -o "${BUILD_DIR}/${BINARY_NAME}" .

echo "Build complete: ${BUILD_DIR}/${BINARY_NAME}"
