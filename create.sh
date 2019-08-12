#!/usr/bin/env bash
SCRIPT_DIRECTORY="$(cd "$(dirname "$0")";pwd)"
docker build --compress "--tag=parmrm/pg-debuggable:latest" "$SCRIPT_DIRECTORY"
