#!/bin/bash
echo 'Subscribing to topic test/test'
set -e
mosquitto_sub -v -h broker -p 8883 -t 'test/test' --id 'test' --cert /sub/client.pem --key /sub/client.key    
