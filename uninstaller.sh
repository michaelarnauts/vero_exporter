#!/bin/bash

# check if run as superuser
if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root" 1>&2
  exit 1
fi

systemctl stop vero_exporter.timer
systemctl disable vero_exporter.timer
systemctl daemon-reload

rm -f "/usr/local/sbin/vero_exporter"

rm -f "/etc/systemd/system/vero_exporter.service"
rm -f "/etc/systemd/system/vero_exporter.timer"

rm -f "/var/lib/node_exporter/textfile_collector/raspberrypi-metrics.prom"