#!/bin/bash
while :
do
    echo 'Publishing to test/test'
    mosquitto_pub -h broker -p ${PUB_PORT} -t 'test/test' -m "$("date")" -d --cert /sub/client.pem --key /sub/client.key    
    sleep 2s
done
