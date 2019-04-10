FROM debian:9.6-slim
LABEL maintainer="Varlog <varlog.err@gmail.com>"

# base layer, install tini
ENV TINI_VERSION=v0.18.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /usr/local/bin
RUN chmod 0700 /usr/local/bin/tini

ENV APP_USER=app
ENV DEFAULT_APP_USER_ID=1000
ENV APP_GROUP=app
ENV DEFAULT_APP_GROUP_ID=1000
ENV APP_DIR=/app
ENV APP_DOWNLOADS_DIR=${APP_DIR}/Downloads
ENV APP_CONFIG_DIR=${APP_DIR}/.config
ENV APP_TORRENTS_DIR=${APP_DIR}/.torrents

# install build dependences
RUN apt-get update \
    && apt-get install -y software-properties-common
    
# install deluge
RUN add-apt-repository 'deb http://ppa.launchpad.net/deluge-team/ppa/ubuntu xenial main' \
    && apt-get update \
    && apt-get install --allow-unauthenticated -qy deluged deluge-web

# often layer, install supervisor
RUN apt-get update && apt-get install -y supervisor

# clean up
RUN apt-get -y clean autoclean autoremove \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

VOLUME ["${APP_DOWNLOADS_DIR}", "${APP_CONFIG_DIR}", "${APP_TORRENTS_DIR}"]
WORKDIR ${APP_DIR}

# exposes ports
EXPOSE 8112/tcp 45682 53160/tcp 53160/udp 58846/tcp

# copy assets
COPY docker-entrypoint.sh /usr/local/bin/
COPY supervisord.conf /etc/
COPY core.conf /tmp/

# change binaries permission
RUN chmod 0700 /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["tini", "--"]
CMD docker-entrypoint.sh
