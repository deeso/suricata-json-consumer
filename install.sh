#!/bin/bash

# install the required python packages
sudo pip3 install -r requirements.txt

# create the required directories and copy the supporting files
sudo mkdir /opt/suricata-json-consumer
sudo cp suricata-json-consumer.py /opt/suricata-json-consumer/
sudo cp suricata-json-consumer.toml /opt/suricata-json-consumer/
sudo cp suricata-json-consumer.sh /opt/suricata-json-consumer/
sudo chmod a+x /opt/suricata-json-consumer/suricata-json-consumer.py
sudo chmod a+x /opt/suricata-json-consumer/suricata-json-consumer.sh
# sudo cp svc-suricata-json-consumer.sh /opt/suricata-json-consumer/

# adjust the permisions
# sudo chmod a+x /opt/suricata-json-consumer/suricata-json-consumer.sh
# sudo chmod a+x /opt/suricata-json-consumer/svc-suricata-json-consumer.sh

# copy start-up files and add the Ubuntu service
sudo cp svc-suricata-json-consumer.sh /etc/init.d/suricata-json-consumer
sudo chmod a+x /etc/init.d/suricata-json-consumer
sudo update-rc.d suricata-json-consumer defaults
sudo update-rc.d suricata-json-consumer enable

#sudo cp suricata-json-consumer.service /etc/systemd/system/
#sudo systemctl daemon-reload
#sudo systemctl enable suricata-json-consumer.service
#sudo systemctl start suricata-json-consumer.service
