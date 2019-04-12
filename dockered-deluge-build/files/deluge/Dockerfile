FROM debian:9.8-slim
LABEL maintainer="Varlog <varlog.err@gmail.com>"

ARG TINI_VERSION=v0.18.0
ARG DEFAULT_APP_USER_ID=1000
ARG DEFAULT_APP_GROUP_ID=1000

ENV APP_USER=app \
    APP_USER_ID=${DEFAULT_APP_USER_ID} \
    APP_GROUP=app \
    APP_GROUP_ID=${DEFAULT_APP_GROUP_ID} \
    APP_DIR=/app
ENV APP_DOWNLOADS_DIR=${APP_DIR}/Downloads \
    APP_CONFIG_DIR=${APP_DIR}/.config \
    APP_TORRENTS_DIR=${APP_DIR}/.torrents

RUN : \
    # install build dependences
    && apt-get update \
    && apt-get install -y software-properties-common \
    # install supervisor
    && apt-get install -y supervisor \
    # install deluge
    && add-apt-repository 'deb http://ppa.launchpad.net/deluge-team/ppa/ubuntu xenial main' \
    && apt-get update \
    && apt-get install --allow-unauthenticated -qy deluged deluge-web \
    # clean up
    && apt-get -y clean \
    && apt-get -y autoclean \
    && apt-get -y autoremove \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

VOLUME ["${APP_DOWNLOADS_DIR}", "${APP_CONFIG_DIR}", "${APP_TORRENTS_DIR}"]
WORKDIR ${APP_DIR}

# exposes ports
EXPOSE 8112/tcp 45682 53160/tcp 53160/udp 58846/tcp

# copy assets
COPY docker-entrypoint.sh /usr/local/bin/
COPY supervisord.conf /etc/
COPY core.conf /tmp/
# install tini
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /usr/local/bin

# change binaries permission
RUN : \
    && chmod 0700 /usr/local/bin/docker-entrypoint.sh \
    && chmod 0700 /usr/local/bin/tini

ENTRYPOINT ["tini", "--"]
CMD docker-entrypoint.sh
