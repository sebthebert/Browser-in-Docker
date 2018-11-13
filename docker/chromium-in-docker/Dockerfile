FROM ubuntu

MAINTAINER Sebastien Thebert <stt@onetool.pm>

RUN apt-get update && apt-get upgrade -y

RUN apt-get install chromium-browser -y

ENTRYPOINT chromium-browser  --no-sandbox
