#!/bin/bash

# check if run as superuser
if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root" 1>&2
  exit 1
fi

curl -sL "https://github.com/michaelarnauts/vero_exporter/archive/master.zip" > "/tmp/vero_exporter.zip"
unzip -qq -o "/tmp/vero_exporter.zip" -d "/tmp"

mkdir -p "/var/lib/node_exporter/textfile_collector"

mv "/tmp/vero_exporter-master/vero_exporter" "/usr/local/sbin/"
chmod +x "/usr/local/sbin/vero_exporter"

mv "/tmp/vero_exporter-master/vero_exporter.service" "/etc/systemd/system/"
mv "/tmp/vero_exporter-master/vero_exporter.timer" "/etc/systemd/system/"

systemctl stop vero_exporter.timer
systemctl disable vero_exporter.timer

systemctl daemon-reload
systemctl enable vero_exporter.timer
systemctl start vero_exporter.timer

rm -f "/tmp/vero_exporter.zip"
rm -rf "/tmp/vero_exporter-master"
