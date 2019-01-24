FROM alpine:3.8
LABEL maintainer="Varlog <varlog.err@gmail.com>"

ENV SAMBA_APP_DIR=/app
ENV SAMBA_CONF_DIR=/etc/samba
ENV SAMBA_CONF=${SAMBA_CONF_DIR}/smb.conf
ENV SAMBA_CUSTOM_CONF_DIR=${SAMBA_CONF_DIR}/conf.d
ENV SMBSHARE_USER=app
ENV SMBSHARE_GROUP=app

# install samba, bash, supervisor and tini
RUN apk --no-cache add samba bash supervisor tini

# create custom config directory
RUN mkdir ${SAMBA_CUSTOM_CONF_DIR}

# create smbshare user
RUN  addgroup -g 1000 ${SMBSHARE_GROUP} \
  && adduser -D -H -G ${SMBSHARE_GROUP} -s /bin/false -u 1000 ${SMBSHARE_USER}

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
