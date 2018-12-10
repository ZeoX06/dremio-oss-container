# dremio-oss-container

Dockerfiles to build and deploy dremio-oss

Only to test single node deployment!

# How to use

Create a docker-compose.yml file:

    version: "3"

    services:
      app:
        image: zeox06/dremio-oss
        restart: always
        ports:
          - "9047:9047"
          - "31010:31010"
          - "45678:45678"

Open: http://localhost:9047
