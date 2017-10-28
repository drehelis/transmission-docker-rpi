FROM arm32v6/alpine:latest

LABEL maintainer "autogun@gmail.com"

VOLUME [ "/sys/fs/cgroup" ]
VOLUME ["/downloads", "/incomplete", "/watch", "/config"]

RUN apk add --update \
    transmission-daemon \
    && rm -rf /var/cache/apk/*

RUN mkdir -p /transmission/downloads \
    /transmission/incomplete \
    /transmission/watch \
    /transmission/config \
    /root/downloads/tv

EXPOSE 9091 45555/tcp 45555/udp

ENTRYPOINT ["/usr/bin/transmission-daemon"]

CMD ["--foreground", "--config-dir=/"]
