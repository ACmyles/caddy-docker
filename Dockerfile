FROM caddy:2.5.0-builder-alpine AS builder

RUN xcaddy build \
    --with github.com/greenpau/caddy-security \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/kirsch33/realip

FROM caddy:2.5.0-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy