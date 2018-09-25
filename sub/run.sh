#!/bin/bash
echo 'Subscribing to topic test/test'
set -e
mosquitto_sub -v -h broker -p ${SUB_PORT} -t 'test/test' --id 'test' --cert /sub/client.crt --key /sub/client.key --cafile /sub/all-ca.crt --insecure 
