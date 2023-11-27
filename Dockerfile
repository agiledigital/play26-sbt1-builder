#
# Play 2.6 Build Image
# Docker image with libraries and tools as required for building Play 2.6 projects using SBT 
#

FROM node:16-alpine AS node
FROM adoptopenjdk/openjdk8:alpine
MAINTAINER Agile Digital <info@agiledigital.com.au>
LABEL Description="Docker image with libraries and tools as required for building Play 2.6 projects using SBT " Vendor="Agile Digital" Version="0.1"

RUN apk add --update --no-cache bash libsodium curl docker

COPY --from=node /usr/lib /usr/lib
COPY --from=node /usr/local/lib /usr/local/lib
COPY --from=node /usr/local/include /usr/local/include
COPY --from=node /usr/local/bin /usr/local/bin

RUN npm install -g @cyclonedx/cdxgen

ENV sbt_version 1.4.5
ENV sbt_home /usr/local/sbt
ENV PATH ${PATH}:${sbt_home}/bin

# Install sbt
RUN mkdir -p "$sbt_home/bin"
RUN curl -L "https://github.com/sbt/sbt/releases/download/v1.4.5/sbt-1.4.5.tgz" | tar xz -C /usr/local 
