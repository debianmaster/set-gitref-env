#!/bin/sh -l
master="master"
if [ "${GITHUB_REF##*/}" == "$master" ]; then
    echo 'RELEASE_TAG=latest' >> $GITHUB_ENV
else
    tag="RELEASE_TAG="${GITHUB_REF##*/}
    echo $tag >> $GITHUB_ENV
fi
