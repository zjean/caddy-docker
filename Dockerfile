ARG CADDY_VERSION=2.8.4
ARG CADDY_DOCKER_PROXY_VERSION=v2.9.1

FROM caddy:${CADDY_VERSION}-builder AS builder

RUN xcaddy build \
  --with github.com/lucaslorentz/caddy-docker-proxy/v2@${CADDY_DOCKER_PROXY_VERSION} \
  --with github.com/caddy-dns/transip \
  --with github.com/caddy-dns/mijnhost


FROM caddy:${CADDY_VERSION}

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

CMD ["caddy", "docker-proxy"]
