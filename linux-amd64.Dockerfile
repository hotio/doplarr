FROM ghcr.io/hotio/base@sha256:1a0aa67c51aa3789f3453e7d0e000149ac67dc1f6bb9173d4ee6243cc83597ce

RUN apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing openjdk16-jre-headless

ARG VERSION
RUN curl -fsSL "https://github.com/kiranshila/Doplarr/releases/download/v${VERSION}/doplarr.jar" > "${APP_DIR}/doplarr.jar" && \
    curl -fsSL "https://github.com/kiranshila/Doplarr/releases/download/v${VERSION}/config.edn" > "${APP_DIR}/config.edn" && \
    chmod -R u=rwX,go=rX "${APP_DIR}"

COPY root/ /
