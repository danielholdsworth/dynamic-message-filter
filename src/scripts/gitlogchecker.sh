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
linesinfile=$(wc -l <"$PARAM_FILE" | xargs)

if [ "$filesize" -gt 3 ]; then
  IS_TRIGGERED=true
else
  IS_TRIGGERED=false
fi

if [ "$linesinfile" -gt 1 ]; then
  #add logic to recreate file
  sed -i 's/:/: /g' "$PARAM_FILE" # add whitespace after colon
  sed -i 's/[{}]//g' "$PARAM_FILE" # remove all braces
  sed -i s/$/,/ "$PARAM_FILE"; sed -i '$ s/.$//' "$PARAM_FILE" # add , to end of files then remove from last
  sed -i '1s/^/{\n/' "$PARAM_FILE" # add { on first line
  echo "}" >> "$PARAM_FILE" # add } to end of file
fi

if [ "$IS_TRIGGERED" = false ]; then
  echo '{}' >> /tmp/pipeline-parameters.json
fi
