FROM alpine

ENV FROMPORT 2015
ENV PROXYADDR example.com:8080

RUN apk add --no-cache tar curl && \
    curl -Lo ./caddy.tgz https://github.com/caddyserver/caddy/releases/download/v2.0.0/caddy_2.0.0_linux_amd64.tar.gz && \
    tar zxvf caddy.tgz && \
    chmod +x /caddy && \
    rm -rf LICENSE README.md

CMD ["sh", "-c", "/caddy reverse-proxy --from :${FROMPORT} --to ${PROXYADDR}"]