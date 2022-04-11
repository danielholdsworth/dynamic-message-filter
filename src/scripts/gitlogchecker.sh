#!/bin/bash

GIT_COMMIT_MSG=$(git log --pretty=oneline -n 1)

PARAM_FILE="/tmp/pipeline-parameters.json"

while IFS= read -r line; do
  if [[ $GIT_COMMIT_MSG == *"[$line]"* ]]; then
    echo "Continuation Requested!"
    echo '{"'"$line"'":true}' >> $PARAM_FILE
  else
    echo "No Continuation Requested!"
  fi
done <<< "$PARAM"

filesize=$(wc -c <"$PARAM_FILE" | xargs)

if [ "$filesize" -gt 3 ]; then
  IS_TRIGGERED=true
else
  IS_TRIGGERED=false
fi

if [ "$IS_TRIGGERED" = false ]; then
  echo '{}' >> /tmp/pipeline-parameters.json
fi
