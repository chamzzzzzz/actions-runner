#!/bin/bash

RUNNER_HOST=${1}
RUNNER_NAME=${2}
RUNNER_URL=${3}
RUNNER_TOKEN=${4}

docker run -d --name ${RUNNER_NAME}-actions-runner --mount source=${RUNNER_NAME}-actions-runner,destination=/root/runner -e RUNNER_HOST="${RUNNER_HOST}" -e RUNNER_NAME="${RUNNER_NAME}" -e RUNNER_URL="${RUNNER_URL}" -e RUNNER_TOKEN="${RUNNER_TOKEN}" ghcr.io/chamzzzzzz/actions-runner:latest

