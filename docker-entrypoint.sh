#!/bin/bash
set -e

CONFIG_PATH=/data/options.json

MQTTHOST="$(jq -r ".mqtthost // empty" $CONFIG_PATH)"
MQTTPORT="$(jq -r '.mqttport // empty' $CONFIG_PATH)"
MQTTUSER="$(jq -r ".mqttuser // empty" $CONFIG_PATH)"
MQTTPASS="$(jq -r ".mqttpass // empty" $CONFIG_PATH)"
DEVICE="$(jq -r ".device // empty" $CONFIG_PATH)"

setserial $DEVICE low_latency

ebusd -f --scanconfig --mqttport=$MQTTPORT --mqtthost=$MQTTHOST --mqttuser=$MQTTUSER --mqttpass=$MQTTPASS --mqttretain --mqttint=/etc/ebusd/mqtt-hassio.cfg --mqttjson --device=$DEVICE 
