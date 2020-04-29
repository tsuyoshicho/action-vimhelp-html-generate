FROM thinca/vim:v8.2.0640

RUN apk --update add tree git && \
    rm -rf /var/lib/apt/lists/* && \
    rm /var/cache/apk/*

RUN git clone --depth 1 --separate-git-dir gitdir-github https://github.com/cormacrelf/vim-colors-github.git tools/github && \
    cp -a tools/ /tools/

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
