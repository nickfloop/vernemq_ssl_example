#!/bin/bash
while :
do
    echo 'Publishing to test/test'
    mosquitto_pub -h broker -p ${PUB_PORT} -t 'test/test' -m "$("date")" -d --cert /pub/client.crt --key /pub/client.key --cafile /pub/all-ca.crt --insecure 
    sleep 2s
done
