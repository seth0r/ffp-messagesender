FROM ubuntu:22.04
MAINTAINER svenr@gfz-potsdam.de

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=UTC

RUN apt-get update 
RUN apt-get dist-upgrade -y
RUN apt-get -y install vim-nox python3-all python3-jinja2 python3-requests python3-pymongo

ENV LOGLEVEL    INFO
ENV TPLDIR      /srv/tpl

COPY querier /srv/querier
COPY emitter /srv/emitter
COPY tpl /srv/tpl
COPY *.py /srv/
WORKDIR /srv

CMD ["./msgsender.py"]
