FROM ubuntu:16.04

RUN apt-get update
RUN apt-get install -y  festival
RUN apt-get install -y sox lame

ADD ttsTool/runOnSableFile.sh /
ADD ttsTool/stdparse.sh /
ADD ttsTool/sabler.sh /
RUN mkdir resource
ADD ttsTool/resource/* /resource/


RUN ls -R