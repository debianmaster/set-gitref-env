#!/bin/sh -l

echo "Hello"
printenv
time=$(date)
echo "::set-output name=time::$time"