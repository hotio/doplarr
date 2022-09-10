FROM cr.hotio.dev/hotio/base@sha256:28bb946f53b50b204e0c14ea79daf2eed22b096a4cbc969d13710e9e66be7a3e

RUN apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/community openjdk16-jre-headless

ARG VERSION
RUN curl -fsSL "https://github.com/kiranshila/Doplarr/releases/download/v${VERSION}/doplarr.jar" > "${APP_DIR}/doplarr.jar" && \
    chmod -R u=rwX,go=rX "${APP_DIR}"

COPY root/ /
