#!/bin/bash

sudo snort -q -A alert_fast \
-c /etc/snort/snort.lua \
-R /etc/snort/rules/local.rules \
-i wlan0 
