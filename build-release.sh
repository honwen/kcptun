#!/usr/bin/env bash

which goreleaser >/dev/null 2>&1 || go install -x github.com/goreleaser/goreleaser/v2@latest

goreleaser build --snapshot --clean
