FROM thinca/vim:v8.1.2248

RUN apk --update add tree git && \
    rm -rf /var/lib/apt/lists/* && \
    rm /var/cache/apk/*

RUN git submodule sync --recursive && \
    git submodule update --init --recursive

ADD  tools/ /tools/

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
