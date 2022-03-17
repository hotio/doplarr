FROM cr.hotio.dev/hotio/base@sha256:66c1cd47c5b50c6e3826ba7b4d0417ec1acd509b74dea2e51befe66ad63bff7d

RUN apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/community openjdk16-jre-headless

ARG VERSION
RUN curl -fsSL "https://github.com/kiranshila/Doplarr/releases/download/v${VERSION}/doplarr.jar" > "${APP_DIR}/doplarr.jar" && \
    chmod -R u=rwX,go=rX "${APP_DIR}"

COPY root/ /
