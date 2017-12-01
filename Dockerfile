FROM arm32v6/alpine:latest

LABEL maintainer "autogun@gmail.com"

VOLUME [ "/sys/fs/cgroup" ]

RUN apk add --update \
    transmission-daemon \
    && rm -rf /var/cache/apk/*

RUN mkdir -p /transmission/config \
    /transmission/downloads \
    /transmission/watch

EXPOSE 9091 45555/tcp 45555/udp

ENTRYPOINT ["/usr/bin/transmission-daemon"]

CMD ["--foreground", "--log-info", "--peerport=45555", "--config-dir=/transmission/config", "--watch-dir=/transmission/watch", "--download-dir=/transmission/downloads", "--no-incomplete-dir"]
