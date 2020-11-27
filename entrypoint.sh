#!/bin/sh

apk add jq 
master="master"
if [ "${GITHUB_REF##*/}" == "$master" ]; then
    echo 'RELEASE_TAG=latest' >> $GITHUB_ENV
elif [ $(cat /github/workflow/event.json | jq -r .action) == "release-to-env" ]
then
    tag=$(cat /github/workflow/event.json  | jq -r .client_payload.tag)
    echo "RELEASE_TAG="$tag >> $GITHUB_ENV
else
    tag="RELEASE_TAG="${GITHUB_REF##*/}
    echo $tag >> $GITHUB_ENV
fi
