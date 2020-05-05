#!/usr/bin/env bash
SCRIPT_DIRECTORY="$(cd "$(dirname "$0")";pwd)"
IMAGE_VERSION="11.5-alpine-1.0"

docker build --compress "--tag=parmrm/pg-debuggable:${IMAGE_VERSION}" "--tag=parmrm/pg-debuggable:latest" "$SCRIPT_DIRECTORY"
