#!/bin/bash

GIT_COMMIT_MSG=$(git log --pretty=oneline -n 1)

if [[ $GIT_COMMIT_MSG == *"[$PARAM]"* ]]; then
  echo "Continuation Requested!"
  echo '{"'"$PARAM"'":true}' > /tmp/pipeline-parameters.json
fi