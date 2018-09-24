# VerneMQ SSL Listener Example
This example is currently not working.

## Download and Build
Build with Docker Compose
`git clone git@github.com:nickfloop/vernemq_ssl_example.git && cd vernemq_ssl_example && docker-compose build`

## Start the broker
In one terminal, start the VerneMQ broker
`docker-compose up broker`

The broker uses the vernemq.conf file in the broker/ directory. This config file is supposed to enable an SSL listener on the broker service IP address at port 8883. The broker uses certificates and keys that can be found in the broker/test/ directory. These certificates and keys are the same as used for testing VerneMQ.

## Start subscriber client
In another terminal, start a client that subscribes to the test/test topic
`docker-compose up sub`

The subscriber client uses mosquitto_sub to connect to the broker using a client certificate generated from the broker CA certificate. The client certificate and keys are the same as used for testing VerneMQ.

## Start publisher client
In another terminal, start a client that publishes to the test/test topic every 2 seconds
`docker-compose up pub`

The publisher client uses mosquitto_pub to connect to the broker using a client certificate generated from the broker CA certificate. The client certificate and keys are the same as used for testing VerneMQ. Since the publisher reuses the subscriber certificate, the broker configuration contains the line `allow_multiple_sessions = on`

# Current Behavior
The broker starts up without error. The broker has an MQTT listener on 1883 (even though there is no `listener.tcp.default` line in the config). The broker also has an MQTTS listener on 0.0.0.0:8883. The address 0.0.0.0:8883 is linked to port 8883 of the Docker Compose broker service.

The subscriber hangs silently. It appears the subscriber never receives a CONNACK from the broker.

The publisher hangs . It appears the publisher never receives a CONNACK from the broker, so the publisher reissues a CONNECT message periodically.
