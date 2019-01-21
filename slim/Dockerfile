FROM ubuntu:16.04 AS build

RUN apt-get update && \
    apt-get install -y git \
    maven \
    openjdk-8-jdk \
    curl \
    nodejs \
    npm
   
RUN git clone -b "patch" https://github.com/ZeoX06/dremio-oss.git dremio

WORKDIR /dremio

RUN mvn clean install -e -DskipTests=true -Dlicense.skip=true


FROM openjdk:8-jre-slim
   
COPY --from=build /dremio/distribution/server/target/*.tar.gz /tmp/dremio.tar.gz

WORKDIR /dremio

RUN tar -xvf /tmp/dremio.tar.gz --strip 1 -C /dremio && \
    rm /tmp/dremio.tar.gz

RUN apt-get update && \
    apt-get install -y procps

COPY ./entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
