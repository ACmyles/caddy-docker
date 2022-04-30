FROM caddy:2.5.0-builder-alpine AS builder

RUN xcaddy build \
    --with https://github.com/greenpau/caddy-security \
    --with https://github.com/caddy-dns/cloudflare \
    --with https://github.com/kirsch33/realip

FROM caddy:2.5.0-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy