FROM arm32v6/alpine:latest

LABEL maintainer "autogun@gmail.com"

VOLUME [ "/sys/fs/cgroup" ]
VOLUME ["/downloads", "/incomplete", "/watch", "/config"]

RUN apk add --update \
    transmission-daemon \
    && rm -rf /var/cache/apk/*

EXPOSE 9092 51413/tcp 51413/udp

ADD ./settings.json /settings.json

ENTRYPOINT ["/usr/bin/transmission-daemon"]

CMD ["--foreground", "--config-dir=/"]
