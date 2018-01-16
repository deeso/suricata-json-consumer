#!/bin/sh
PYTHON=/usr/bin/python3
SCRIPT=/opt/suricata-json-consumer/suricata-json-consumer.py
CONFIG=/opt/suricata-json-consumer/suricata-json-consumer.toml
$PYTHON $SCRIPT -config $CONFIG &
