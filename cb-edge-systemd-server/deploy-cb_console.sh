#!/usr/bin/env bash

# mkdir /opt/conf
# mkdir /opt/iotright

mv ./cb_console /opt/iotright/

mv ./cb_console.sh /usr/local/bin/
chmod 755 /usr/local/bin/cb_console.sh
mv ./cb_console.service /etc/systemd/system/
chmod 755 /etc/systemd/system/cb_console.service
