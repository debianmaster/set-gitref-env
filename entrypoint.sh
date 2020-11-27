#!/bin/sh

apk add jq 
master="master"
echo "before"
cat $GITHUB_ENV
if [ $(cat /github/workflow/event.json | jq -r .action) == "release-to-env" ]; then
    echo 'RELEASE_TAG=latest' >> $GITHUB_ENV
    echo "1"
    cat $GITHUB_ENV
elif [ "${GITHUB_REF##*/}" == "$master" ]
then
    tag=$(cat /github/workflow/event.json  | jq -r .client_payload.tag)
    echo "RELEASE_TAG="$tag >> $GITHUB_ENV
    echo "2"
    cat $GITHUB_ENV
else
    tag="RELEASE_TAG="${GITHUB_REF##*/}
    echo $tag >> $GITHUB_ENV
    echo "3"
    cat $GITHUB_ENV
fi
echo "after"
cat $GITHUB_ENV