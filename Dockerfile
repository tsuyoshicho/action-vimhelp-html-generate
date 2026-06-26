FROM thinca/vim:latest@sha256:77da01fd3a9fe67a3366d6fa375b5388db8c74c4c03a12638d8c1b62f06aa0bb

RUN apk --update add tree git && \
    rm -rf /var/lib/apt/lists/* && \
    rm /var/cache/apk/*

COPY tools/ /tools/
RUN git clone --depth 1 https://github.com/cormacrelf/vim-colors-github.git /tools/github && \
    rm -rf /tools/github/.git

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
