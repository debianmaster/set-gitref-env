#!/bin/sh -l
master="master"
if [ "${GITHUB_REF##*/}" == "$master" ]; then
    echo 'RELEASE_TAG=latest' >> $GITHUB_ENV
elif [ $(cat /tmp/event.json | jq -r .action) == "release-to-env" ]
then
    tag=$(cat /tmp/event.json  | jq -r .client_payload.tag)
    echo $tag >> $GITHUB_ENV
else
    tag="RELEASE_TAG="${GITHUB_REF##*/}
    echo $tag >> $GITHUB_ENV
fi
