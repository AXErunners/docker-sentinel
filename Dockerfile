FROM phusion/baseimage:0.9.18
MAINTAINER AXErunners <info@axerunners.com>

ARG USER_ID
ARG GROUP_ID

RUN apt-get update && \
    apt-get install git curl mysql-client python-dev python-pytest python-virtualenv -y && \
    git clone https://github.com/axerunners/sentinel.git /sentinel && \
    cd /sentinel && \
    git checkout master && \
    pip install cython && \
    virtualenv ./venv && \
    ./venv/bin/pip install -r requirements.txt && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV HOME /sentinel