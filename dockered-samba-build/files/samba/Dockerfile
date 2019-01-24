FROM ubuntu:18.04
LABEL maintainer="Varlog <varlog.err@gmail.com>"

# basic layer
ENV TINI_VERSION=v0.18.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /usr/local/bin
RUN chmod 0700 /usr/local/bin/tini

# often layer, install supervisor
RUN apt-get update && apt-get install -y supervisor

# app layer
ENV SAMBA_APP_DIR=/app
ENV SAMBA_CONF_DIR=/etc/samba
ENV SAMBA_CONF=${SAMBA_CONF_DIR}/smb.conf
ENV SAMBA_CUSTOM_CONF_DIR=${SAMBA_CONF_DIR}/conf.d
ENV SMBSHARE_USER=app
ENV SMBSHARE_GROUP=app

# install samba and run cleanup
RUN apt-get install -y samba && apt-get clean -y

# create custom config directory
RUN mkdir ${SAMBA_CUSTOM_CONF_DIR}

# create smbshare user
RUN addgroup -q --gid 1000 ${SMBSHARE_GROUP} \
    && adduser -q --disabled-login \
      --ingroup ${SMBSHARE_GROUP} \
      --shell /bin/false \
      --no-create-home --uid 1000 ${SMBSHARE_USER}

# copy assets
COPY docker-entrypoint.sh /usr/local/bin
COPY smb.conf /etc/samba
COPY supervisord.conf /etc/

# change binaries permission
RUN chmod 0700 /usr/local/bin/docker-entrypoint.sh

# exposes samba default ports (137, 138 for nmbd and 139, 445 for smbd)
EXPOSE 137/udp 138/udp 139 445

VOLUME ["${SAMBA_APP_DIR}"]
WORKDIR ${SAMBA_APP_DIR}

ENTRYPOINT ["tini", "--"]
CMD docker-entrypoint.sh
