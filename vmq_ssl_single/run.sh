#!/bin/bash
cp /vmq/vernemq/vernemq.conf /etc/vernemq/vernemq.conf
cp /vmq/vernemq/vernemq.conf /etc/vernemq/vernemq.conf.local
start_vernemq &
sleep 7s
while :
do
    mosquitto_pub -h localhost -p 8883 -t test/test -m "test" -d --cert ./sub/client.crt --key ./sub/client.key --cafile /etc/vernemq/ssl/all-ca.crt
    sleep 2s
done
