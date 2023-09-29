#!/bin/bash
echo "Maestro: $HOSTNAME"
service ssh start
while :; do :; done & kill -STOP $! && wait $!
