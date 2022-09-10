FROM cr.hotio.dev/hotio/base@sha256:3c39dad385f58b6181e4241ca35f1eaa79adfe4f435e42cba564b6b06dc3e03a

RUN apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/community openjdk16-jre-headless

ARG VERSION
RUN curl -fsSL "https://github.com/kiranshila/Doplarr/releases/download/v${VERSION}/doplarr.jar" > "${APP_DIR}/doplarr.jar" && \
    chmod -R u=rwX,go=rX "${APP_DIR}"

COPY root/ /
RUN chmod -R +x /etc/cont-init.d/
