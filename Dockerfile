FROM thinca/vim:v8.1.2248

ADD  tools/ /tools/

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
