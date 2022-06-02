FROM alpine:3.15
ARG S6_OVERLAY_VERSION=3.1.0.1
ARG ARCH=x86_64

RUN apk add --no-cache nfs-utils

ADD https://github.com/just-containers/s6-overlay/releases/download/v${S6_OVERLAY_VERSION}/s6-overlay-noarch.tar.xz /tmp
RUN tar -C / -Jxpf /tmp/s6-overlay-noarch.tar.xz
ADD https://github.com/just-containers/s6-overlay/releases/download/v${S6_OVERLAY_VERSION}/s6-overlay-${ARCH}.tar.xz /tmp
RUN tar -C / -Jxpf /tmp/s6-overlay-${ARCH}.tar.xz

COPY s6/config.init /etc/cont-init.d/00-config
COPY s6/rpcbind.run /etc/services.d/rpcbind/run
COPY s6/mountd.run /etc/services.d/mountd/run

EXPOSE 111/udp 2049/tcp 2049/udp

CMD ["/init"]
