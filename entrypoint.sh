#!/bin/sh -l
master="master"
if [ "${GITHUB_REF##*/}" == "$master" ]; then
    echo 'RELEASE_TAG=latest' >> $GITHUB_ENV
else
    echo 'RELEASE_TAG=${GITHUB_REF##*/}' >> $GITHUB_ENV
fi
