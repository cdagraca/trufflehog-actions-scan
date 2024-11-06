FROM python:3.7-alpine

ENV HTTP_PROXY=$HTTP_PROXY
ENV HTTPS_PROXY=$HTTPS_PROXY
ENV NO_PROXY=$NO_PROXY

LABEL name="trufflehog-actions-scan"
LABEL version="1.0.0"
LABEL repository="https://github.com/edplato/trufflehog-actions-scan"
LABEL homepage="https://github.com/edplato/trufflehog-actions-scan"
LABEL maintainer="Ed Plato"

LABEL "com.github.actions.name"="Trufflehog Actions Scan"
LABEL "com.github.actions.description"="Scan repository for secrets with basic trufflehog defaults in place for easy setup."
LABEL "com.github.actions.icon"="shield"
LABEL "com.github.actions.color"="yellow"

RUN pip3 install trufflehog3==3.0.10
RUN apk --update add git less openssh && \
  rm -rf /var/lib/apt/lists/* && \
  rm /var/cache/apk/*

ADD entrypoint.sh  /entrypoint.sh
ADD regexes.json /regexes.json

ENTRYPOINT ["/entrypoint.sh"]
