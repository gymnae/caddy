
ARG CADDY_VERSION=latest

FROM caddy:${CADDY_VERSION} AS builder

RUN xcaddy build \
  --with github.com/lucaslorentz/caddy-docker-proxy/v2 \
  --with github.com/caddy-dns/cloudflare \
  --with github.com/greenpau/caddy-security \
  --with github.com/mholt/caddy-l4 \
  --with github.com/RussellLuo/caddy-ext/layer4

FROM caddy:${CADDY_VERSION}-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

#CMD ["caddy", "docker-proxy"]
