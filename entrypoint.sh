#!/bin/sh -l

echo "Hello"
printenv
time=$(date)
echo "::set-env name=time::$time"