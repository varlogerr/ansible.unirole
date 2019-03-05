#!/usr/bin/env bash

set +x

APP_USER_ID=${APP_USER_ID:-${DEFAULT_APP_USER_ID}}
APP_GROUP_ID=${APP_GROUP_ID:-${DEFAULT_APP_GROUP_ID}}

# create app group and user
addgroup -q --gid ${APP_GROUP_ID} ${APP_GROUP} \
&& adduser -q --disabled-login \
   --ingroup ${APP_GROUP} \
   --shell /bin/bash --gecos ",,," \
   --home ${APP_DIR} \
   --uid ${APP_USER_ID} ${APP_USER} \
&& chown ${APP_USER}:${APP_GROUP} ${APP_DIR}

# change config and Downloads directory owners
chown ${APP_USER}:${APP_GROUP} ${APP_DOWNLOADS_DIR}
chown ${APP_USER}:${APP_GROUP} ${APP_CONFIG_DIR}

# create directories
dirs_list="$(compgen -e | grep ^dir_path_ | sort -V)"
if [ -n "${dirs_list}" ]; then
  echo "creating directories..."

  while read var_name; do
    path=${!var_name}
    owner=${APP_USER}
    group=${APP_GROUP}

    mkdir -p "${path}"
    chown "${owner}":"${group}" "${path}"

    echo "\"${path}\" directory created..."
  done <<< "${dirs_list}"

  echo ""
fi

supervisord -c /etc/supervisord.conf
