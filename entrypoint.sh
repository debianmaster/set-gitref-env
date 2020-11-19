#!/bin/sh -l
master="master"
if [ "${GITHUB_REF##*/}" == "$master" ]; then
    echo 'RELEASE_TAG=latest' >> $GITHUB_ENV
else
    tag="${GITHUB_REF##*/}"
    echo $tag
    echo 'RELEASE_TAG=${tag}' >> $GITHUB_ENV
fi
