#
# Play 2.6 Build Image
# Docker image with libraries and tools as required for building Play 2.6 projects using SBT 
#

FROM adoptopenjdk/openjdk8:alpine
MAINTAINER Agile Digital <info@agiledigital.com.au>
LABEL Description="Docker image with libraries and tools as required for building Play 2.6 projects using SBT " Vendor="Agile Digital" Version="0.1"

RUN apk add --update --no-cache bash libsodium curl docker

ENV sbt_version 1.3.9
ENV sbt_home /usr/local/sbt
ENV PATH ${PATH}:${sbt_home}/bin

# Install sbt
RUN mkdir -p "$sbt_home/bin"
RUN curl -L "https://piccolo.link/sbt-1.3.9.tgz" | tar xz -C /usr/local 
RUN sbt exit
