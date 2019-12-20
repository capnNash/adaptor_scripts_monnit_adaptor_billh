#!/usr/bin/env bash

mkdir /opt/conf
mkdir /opt/iotright

mv ./edge /opt/iotright/

mv ./edge.sh /usr/local/bin/
chmod 755 /usr/local/bin/edge.sh
mv ./edge.service /etc/systemd/system/
chmod 755 /etc/systemd/system/edge.service
