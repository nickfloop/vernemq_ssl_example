# VerneMQ SSL Listener Example
This example is currently working!

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

## Test with MQTT
By default, this example configures the pub and sub clients to connect on port 8883. You can test MQTT by changing environment variables in the docker-compose.yml file. Specifically, change the SUB_PORT and PUB_PORT values to 1883 to use MQTT instead.

