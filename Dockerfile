FROM thinca/vim:v8.1.2248

RUN apk --update add tree && \
    rm -rf /var/lib/apt/lists/* && \
    rm /var/cache/apk/*

ADD  tools/ /tools/

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
