FROM alpine:3.18.0

WORKDIR /beat

RUN addgroup -g 1000 redes && adduser -D -u 1000 -G redes redes

COPY entrypoint.sh /beat/entrypoint.sh

RUN chown redes:redes /beat/entrypoint.sh && chmod +x /beat/entrypoint.sh

USER redes

ENTRYPOINT ["sh", "/beat/entrypoint.sh"]