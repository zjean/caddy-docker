ARG CADDY_VERSION=2.10.2
ARG CADDY_DOCKER_PROXY_VERSION=v2.10.0

FROM caddy:${CADDY_VERSION}-builder AS builder

RUN xcaddy build \
  --with github.com/lucaslorentz/caddy-docker-proxy/v2@${CADDY_DOCKER_PROXY_VERSION} \
  --with github.com/caddy-dns/mijnhost \
  --with github.com/mholt/caddy-dynamicdns


FROM caddy:${CADDY_VERSION}

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

CMD ["caddy", "docker-proxy"]
