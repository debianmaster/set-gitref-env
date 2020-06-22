#!/bin/sh -l
echo ::set-env name=RELEASE_TAG::$(echo ${GITHUB_REF##*/})