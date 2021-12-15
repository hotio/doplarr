FROM cr.hotio.dev/hotio/base@sha256:c96bfafa6be3ecc00ad9f64d5b45afc2c7957dec6c430c244a182729b3c10184

RUN apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing openjdk16-jre-headless

ARG VERSION
RUN curl -fsSL "https://github.com/kiranshila/Doplarr/releases/download/v${VERSION}/doplarr.jar" > "${APP_DIR}/doplarr.jar" && \
    chmod -R u=rwX,go=rX "${APP_DIR}"

COPY root/ /
