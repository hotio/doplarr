FROM cr.hotio.dev/hotio/base@sha256:ab76c33229508fe135b2ef84762fee8c28520d15e5b8ed19da99ac88f34f9dd0

RUN apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/community openjdk16-jre-headless

ARG VERSION
RUN curl -fsSL "https://github.com/kiranshila/Doplarr/releases/download/v${VERSION}/doplarr.jar" > "${APP_DIR}/doplarr.jar" && \
    chmod -R u=rwX,go=rX "${APP_DIR}"

COPY root/ /
