FROM caddy:2.7.3-builder-alpine AS builder

RUN xcaddy build \
    --with github.com/greenpau/caddy-security \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/caddyserver/transform-encoder

FROM caddy:2.7.3-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy