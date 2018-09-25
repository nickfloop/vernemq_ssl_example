# VerneMQ Single Docker Container SSL Example
## Build
`./build.sh`
Downloads and builds the Docker image, then starts a running container and places you in a bash shell inside the container.

## Run 
`./run.sh`
Inside of the Docker container, run the test script to start a VerneMQ server and publish to it every two seconds using mosquitto_pub. The broker is configured to use the VerneMQ test server and CA certs on localhost:8883 and the publisher uses the client test certs to publish.

# Current Behavior
The broker start without error. The publishers starts and returns a connection refused: unauthorized error every two seconds.
