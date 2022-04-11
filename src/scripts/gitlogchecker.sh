#!/bin/bash

#GIT_COMMIT_MSG=$(git log --pretty=oneline -n 1)
GIT_COMMIT_MSG="3e0060fbff8b10c673879bd7991ff477592a9adf (HEAD -> alpha, origin/alpha) testing what [api][auth]"

PARAM_FILE="/tmp/pipeline-parameters.json"

PARAM="e2e
api
auth"

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