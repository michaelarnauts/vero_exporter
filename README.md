# vero_exporter
Prometheus exporter for Vero 4K+ metrics

Based on https://github.com/fahlke/raspberrypi_exporter

## Prerequisites

- Prometheus node_exporter must be installed
- node_exporter ```--collector.textfile.directory``` must be set to ```/var/lib/node_exporter/textfile_collector```
- ```curl``` must be installed

## Usage

Installation

    $ curl -fsSL "https://raw.githubusercontent.com/michaelarnauts/vero_exporter/master/installer.sh" | sudo bash

Check if the service is running

    $ systemctl status vero_exporter.timer
    ● vero_exporter.timer - Timer for the Vero 4K+ Prometheus exporter
       Loaded: loaded (/etc/systemd/system/vero_exporter.timer; enabled; vendor preset: enabled)
       Active: active (waiting) since Mon 2017-12-18 20:54:40 UTC; 5min ago

Check if the metrics are written to disk

    $ grep -E "^vero" /var/lib/node_exporter/textfile_collector/vero-metrics.prom
    vero_temperature{sensor="thermal_zone0",type="soc_thermal"} 56.000

Uninstallation

    $ curl -fsSL "https://raw.githubusercontent.com/michaelarnauts/vero_exporter/master/uninstaller.sh" | sudo bash

## References

List of vcgencmd commands and options:

- [RPI vcgencmd usage](https://www.elinux.org/RPI_vcgencmd_usage)
- [vcgencmd Commands](https://github.com/nezticle/RaspberryPi-BuildRoot/wiki/VideoCore-Tools#vcgencmd-commands)
