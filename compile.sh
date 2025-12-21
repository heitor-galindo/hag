#!/bin/bash
set -e

mkdir -p bin

VERSION=$(git describe --tags --dirty --always)

# Linux
GOOS=linux GOARCH=amd64 \
go build -ldflags="-s -w -X main.version=${VERSION}" -o bin/hag-linux-amd64-${VERSION} ./cmd/hag

# macOS (Intel)
GOOS=darwin GOARCH=amd64 \
go build -ldflags="-s -w -X main.version=${VERSION}" -o bin/hag-darwin-amd64-${VERSION} ./cmd/hag

# macOS (Apple Silicon)
GOOS=darwin GOARCH=arm64 \
go build -ldflags="-s -w -X main.version=${VERSION}" -o bin/hag-darwin-arm64-${VERSION} ./cmd/hag

# Windows
GOOS=windows GOARCH=amd64 \
go build -ldflags="-s -w -X main.version=${VERSION}" -o bin/hag-windows-amd64-${VERSION}.exe ./cmd/hag
