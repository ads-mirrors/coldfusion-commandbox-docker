# syntax = docker/dockerfile:1
ARG BASE_IMAGE_ARG
FROM ${BASE_IMAGE_ARG}


LABEL maintainer "Jon Clausen <jclausen@ortussolutions.com>"
LABEL repository "https://github.com/Ortus-Solutions/docker-commandbox"

#Hard Code our engine environment
ENV BOX_SERVER_APP_CFENGINE=lucee-light@5

RUN box config set server.defaults.jvm.javaVersion=openjdk17_jre_jdk

# WARM UP THE SERVER
RUN ${BUILD_DIR}/util/warmup-server.sh