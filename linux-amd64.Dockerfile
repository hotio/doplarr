FROM cr.hotio.dev/hotio/base@sha256:a5b4a850b6128d497dd55ea28290133352a80b9992a29e0a6e7918b4021d2ab5

RUN apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/community openjdk16-jre-headless

ARG VERSION
RUN curl -fsSL "https://github.com/kiranshila/Doplarr/releases/download/v${VERSION}/doplarr.jar" > "${APP_DIR}/doplarr.jar" && \
    chmod -R u=rwX,go=rX "${APP_DIR}"

COPY root/ /
