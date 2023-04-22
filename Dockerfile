FROM caddy:builder AS builder

RUN xcaddy build \ 
  --with github.com/lucaslorentz/caddy-docker-proxy/v2 \
  --with github.com/caddy-dns/cloudflare \
  --with github.com/greenpau/caddy-security \
  --with github.com/mholt/caddy-l4 \
  --with github.com/abiosoft/caddy-yaml

FROM caddy:latest
RUN apk add --no-cache nano

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
