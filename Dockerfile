FROM thinca/vim:latest@sha256:4d6a48cb0358428bc4631091fcf05497beb9587873113f34f70eeee13037f358

RUN apk --update add tree git && \
    rm -rf /var/lib/apt/lists/* && \
    rm /var/cache/apk/*

COPY tools/ /tools/
RUN git clone --depth 1 https://github.com/cormacrelf/vim-colors-github.git /tools/github && \
    rm -rf /tools/github/.git

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
