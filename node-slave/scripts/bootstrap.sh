#!/bin/bash
echo "Esclavo: $HOSTNAME"
service ssh start
while :; do :; done & kill -STOP $! && wait $!
