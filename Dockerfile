FROM alpine:3.10

RUN apk --update add vim && \
    rm -rf /var/lib/apt/lists/* && \
    rm /var/cache/apk/*

COPY Makefile /Makefile
COPY tools/ /tools

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
