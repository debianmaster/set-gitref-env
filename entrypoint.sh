#!/bin/sh -l
echo ::set-env name=RELEASE_TAG::$(echo ${GITHUB_REF##*/})
master="master"
if [ "${GITHUB_REF##*/}" == "$master" ]; then
    echo ::set-env name=RELEASE_TAG::latest
fi