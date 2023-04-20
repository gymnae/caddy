FROM caddy:builder AS builder

RUN RUN apk add --no-cache nano

RUN xcaddy build \
  --with github.com/lucaslorentz/caddy-docker-proxy/v2 \
  --with github.com/caddy-dns/cloudflare \
  --with github.com/greenpau/caddy-security \
  --with github.com/mholt/caddy-l4 \
  --with github.com/RussellLuo/caddy-ext/layer4

FROM caddy:latest

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

#CMD ["caddy", "docker-proxy"]
