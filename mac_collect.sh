#!/bin/bash

TITLE="TIMESTAMP"
CSV="$(date +%F_%T)"

echo "$TITLE"
echo "$CSV"

cd /sys/class/net/ || exit
for DEVICE in *
do
   MAC="$(cat "$DEVICE/address")"
   TITLE=$TITLE","
   TITLE=$TITLE$DEVICE
   CSV=$CSV","
   CSV=$CSV$MAC
done

cd ~ || exit
echo "$TITLE" >> macaddr.csv
echo "$CSV" >> macaddr.csv

