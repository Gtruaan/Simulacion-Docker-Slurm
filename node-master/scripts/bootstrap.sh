#!/bin/bash
echo "Maestro: $HOSTNAME"

service ssh start
service munge start
service slurmctld start

while :; do :; done & kill -STOP $! && wait $!
