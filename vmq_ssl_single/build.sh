docker build -t vmq_ssl .
docker run --rm -t -i -v `pwd`/vernemq/ssl:/etc/vernemq/ssl/ -v `pwd`:/vmq --name vmq vmq_ssl:latest bash
