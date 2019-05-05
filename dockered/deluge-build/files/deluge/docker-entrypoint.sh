#!/usr/bin/env bash

set +x

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

    if [[ ! -d "${path}" ]]; then
      mkdir -p "${path}"
      chown "${owner}":"${group}" "${path}"
    fi

    echo "\"${path}\" directory created..."
  done <<< "${dirs_list}"

  echo ""
fi

[[ ! -f ${APP_CONFIG_DIR}/core.conf ]] && cp -f /tmp/core.conf ${APP_CONFIG_DIR}
chown -R ${APP_USER}:${APP_GROUP} ${APP_CONFIG_DIR} 

supervisord -c /etc/supervisord.conf
