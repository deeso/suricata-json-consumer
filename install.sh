#!/bin/bash

# it might be running?
/etc/init.d/suricata-json-consumer stop
# install the required python packages
pip3 install -I --force-reinstall -r requirements.txt 

# create the required directories and copy the supporting files
sudo mkdir /opt/suricata-json-consumer
sudo cp suricata-json-consumer.py /opt/suricata-json-consumer/
sudo cp suricata-json-consumer.toml /opt/suricata-json-consumer/
sudo cp suricata-json-consumer.sh /opt/suricata-json-consumer/
sudo chmod a+x /opt/suricata-json-consumer/suricata-json-consumer.py
sudo chmod a+x /opt/suricata-json-consumer/suricata-json-consumer.sh

# create the system v service and run it at startup
sudo cp svc-suricata-json-consumer.sh /etc/init.d/suricata-json-consumer
sudo chmod a+x /etc/init.d/suricata-json-consumer
sudo update-rc.d suricata-json-consumer defaults
sudo update-rc.d suricata-json-consumer enable

/etc/init.d/suricata-json-consumer start
