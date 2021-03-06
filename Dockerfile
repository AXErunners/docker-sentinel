FROM python:3.8-buster
MAINTAINER AXErunners <info@axerunners.com>

RUN apt-get update && \
    apt-get install git curl -y && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN git clone https://github.com/axerunners/sentinel.git /sentinel && \
    cd /sentinel && \
    rm sentinel.conf && \
    rm -rf .git && \
    pip install -r requirements.txt && exit 0

ENV HOME /sentinel
WORKDIR /sentinel

ADD run.sh /

CMD /run.sh
