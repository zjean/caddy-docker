ARG CADDY_VERSION=2.7.6
ARG CADDY_DOCKER_PROXY_VERSION=v2.8.11

FROM caddy:${CADDY_VERSION}-builder AS builder

RUN xcaddy build \
    --with github.com/lucaslorentz/caddy-docker-proxy/v2@${CADDY_DOCKER_PROXY_VERSION} \
    --with github.com/libdns/transip

FROM caddy:${CADDY_VERSION}

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

CMD ["caddy", "docker-proxy"]
