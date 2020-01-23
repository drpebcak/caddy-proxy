FROM alpine

ENV FROMPORT 2015
ENV PROXYADDR example.com:8080

RUN apk add --no-cache curl && \
    curl -Lo /caddy https://github.com/caddyserver/caddy/releases/download/v2.0.0-beta.13/caddy2_beta13_linux_amd64 && \
    chmod +x /caddy

CMD ["sh", "-c", "/caddy reverse-proxy --from :${FROMPORT} --to ${PROXYADDR}"]