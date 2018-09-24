#!/bin/bash
while :
do
    echo 'Publishing to test/test'
    mosquitto_pub -h broker -p 8883 -t 'test/test' -m "$("date")" -d --cert /sub/client.pem --key /sub/client.key    
    sleep 2s
done
