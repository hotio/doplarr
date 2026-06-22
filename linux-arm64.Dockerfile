# syntax=docker/dockerfile:1
# check=skip=InvalidDefaultArgInFrom
ARG UPSTREAM_IMAGE
ARG UPSTREAM_TAG_SHA

FROM ${UPSTREAM_IMAGE}:${UPSTREAM_TAG_SHA}
ARG IMAGE_STATS
ENV IMAGE_STATS=${IMAGE_STATS}

RUN apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/community openjdk21-jre-headless

ARG VERSION
ARG VERSIONJAVA
RUN curl -fsSL "https://github.com/activexray/doplarr/releases/download/v${VERSIONJAVA}/doplarr.jar" > "${APP_DIR}/doplarr.jar" && \
    curl -fsSL "https://raw.githubusercontent.com/activexray/doplarr/refs/tags/v${VERSIONJAVA}/config.edn" > "${APP_DIR}/config.edn" && \
    curl -fsSL "https://github.com/activexray/doplarr_rs/releases/download/v${VERSION}/doplarr-aarch64-unknown-linux-musl" > "${APP_DIR}/doplarr" && \
    curl -fsSL "https://raw.githubusercontent.com/activexray/doplarr_rs/refs/tags/v${VERSION}/config.example.toml" > "${APP_DIR}/config.toml" && \
    chmod -R u=rwX,go=rX "${APP_DIR}" && \
    chmod +x "${APP_DIR}/doplarr"

COPY root/ /
RUN find /etc/s6-overlay/s6-rc.d -name "run*" -execdir chmod +x {} +
