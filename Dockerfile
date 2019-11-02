FROM alpine:3.10

RUN apk --update add bash vim && \
    rm -rf /var/lib/apt/lists/* && \
    rm /var/cache/apk/*
RUN mkdir /lib64 && \
    ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2

COPY Makefile /Makefile
COPY tools/ /tools

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
