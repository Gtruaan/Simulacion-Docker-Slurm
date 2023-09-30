#!/bin/bash
echo "Maestro: $HOSTNAME"

service ssh start
service munge start
service slurmd start

while :; do :; done & kill -STOP $! && wait $!
