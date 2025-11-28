FROM thinca/vim:latest@sha256:c6253ded05c9a1207079c349e9509c5c7cbc00e8c403922b540f08b21b1b0a2a

RUN apk --update add tree git && \
    rm -rf /var/lib/apt/lists/* && \
    rm /var/cache/apk/*

COPY tools/ /tools/
RUN git clone --depth 1 https://github.com/cormacrelf/vim-colors-github.git /tools/github && \
    rm -rf /tools/github/.git

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
