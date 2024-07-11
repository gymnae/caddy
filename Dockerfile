FROM caddy:builder AS builder
RUN xcaddy build \ 
  --with github.com/caddy-dns/cloudflare \
  --with github.com/greenpau/caddy-security \
  --with github.com/mholt/caddy-l4 \
  --with github.com/abiosoft/caddy-yaml \
  --with github.com/WeidiDeng/caddy-cloudflare-ip \
  --with github.com/caddyserver/replace-response \
  --with github.com/fvbommel/caddy-combine-ip-ranges
FROM caddy:latest
RUN apk add --no-cache nano py3-pip pipx ripgrep
RUN pipx install --user yamllint
WORKDIR /etc/caddy
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
