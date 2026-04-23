FROM thinca/vim:latest@sha256:bfd7b903e7fa25d7b3b9439522aeb3c53f379abbde2fddff5862a2f4779b75ac

RUN apk --update add tree git && \
    rm -rf /var/lib/apt/lists/* && \
    rm /var/cache/apk/*

COPY tools/ /tools/
RUN git clone --depth 1 https://github.com/cormacrelf/vim-colors-github.git /tools/github && \
    rm -rf /tools/github/.git

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
