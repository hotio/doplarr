ARG UPSTREAM_IMAGE
ARG UPSTREAM_DIGEST_ARM64

FROM ${UPSTREAM_IMAGE}@${UPSTREAM_DIGEST_ARM64}
ARG IMAGE_STATS
ENV IMAGE_STATS=${IMAGE_STATS}

RUN apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/community openjdk16-jre-headless

ARG VERSION
RUN curl -fsSL "https://github.com/kiranshila/Doplarr/releases/download/v${VERSION}/doplarr.jar" > "${APP_DIR}/doplarr.jar" && \
    curl -fsSL "https://raw.githubusercontent.com/kiranshila/Doplarr/v${VERSION}/config.edn" > "${APP_DIR}/config.edn" && \
    chmod -R u=rwX,go=rX "${APP_DIR}"

COPY root/ /
