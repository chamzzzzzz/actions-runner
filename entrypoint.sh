#!/bin/bash

export RUNNER_ALLOW_RUNASROOT=1

if [ ! -f ".runner" ]; then
  ./config.sh --name "${RUNNER_HOST}-${RUNNER_NAME}" --url "$RUNNER_URL" --token "$RUNNER_TOKEN" --unattended
fi

./run.sh

