#!/bin/bash

GIT_COMMIT_MSG=$(git log --pretty=oneline -n 1)

if [[ $GIT_COMMIT_MSG == *"[e2e]"* ]]; then
  echo "Continuation Requested!"
  $PARAM = {"e2e":true}
fi