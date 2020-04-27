FROM thinca/vim:v8.2.0640

RUN apk --update add tree git && \
    rm -rf /var/lib/apt/lists/* && \
    rm /var/cache/apk/*

WORKDIR /root
RUN git clone https://github.com/tsuyoshicho/action-vimhelp-html-generate.git cloned
WORKDIR /root/cloned

RUN git submodule sync --recursive && \
    git submodule update --init --recursive

RUN cp -a tools/ /tools/

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
