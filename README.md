# logstashzabbix
VEEERY basic (but useful) logstash monitoring plugin for zabbix

## Features:

- Check if logstash service is up or down on the machine and alert with a trigger
- Stats about the number of events(in/out/filtered)
- Check if there are failures and alert with a trigger
- Stats about the Java heap memory

## Requirements

 - Python 2/3 on a logstash node with zabbix agent installed

## Installation

This only needs to be setup on the logstash node

#### Zabbix Agent

- Copy logstashzabbix.sh to agent scripts folder
- Copy logstashzabbix.conf to conf.d or add UserParameter to your agent config

#### Zabbix Frontend

- Import the XML template (supports zabbix 3.2 and greater)
- Add node to the newly imported template

#### Important note
This is a very little and basic plugin I wrote to monitor my resources. I just wanted to share this if you also need a handy and simple plugin to check some logstash info.


## License
This plugin is published under **GNU General Public License v3.0**. Feel free to use and modify this as you need.

Copyright (©) [**iFedix**](https://github.com/iFedix) 2017