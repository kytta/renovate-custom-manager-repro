FROM node:24.20.0-alpine@sha256:e67514e5d0f6c46656005e1b693b2ec9d52e80b641307de684d4a015ba7a4eaf

# renovate: datasource=repology depName=tini packageName=alpine_3_24/tini versioning=loose
ARG TINI_VERSION=0.19.0-r3

# renovate: datasource=npm packageName=pm2
ARG PM2_VERSION=7.0.4

RUN --mount=type=cache,id=apk,target=/var/cache/apk apk add --update-cache tini=${TINI_VERSION}
RUN --mount=type=cache,target=/root/.npm npm install -g pm2@${PM2_VERSION}

ENTRYPOINT ["/sbin/tini", "-g", "--"]
CMD ["pm2-runtime", "--help"]
