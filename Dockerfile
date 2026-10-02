FROM thinca/vim:latest@sha256:7d7394f29feb4d0b7144fe2e5b98a812f10f8c0a74640ae3012ad7944b605faa

RUN apk --update add tree git && \
    rm -rf /var/lib/apt/lists/* && \
    rm /var/cache/apk/*

COPY tools/ /tools/
RUN git clone --depth 1 https://github.com/cormacrelf/vim-colors-github.git /tools/github && \
    rm -rf /tools/github/.git

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
