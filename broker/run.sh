#!/bin/bash
cp -r /broker/test /etc/vernemq/ssl
cp /broker/vernemq.conf /etc/vernemq/vernemq.conf.local
start_vernemq
