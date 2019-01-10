#!/usr/bin/env bash

set -x

# create share configurations
shares_list="$(compgen -e | grep ^shares_)"
if [ -n "${shares_list}" ]; then
  while read var_name; do
    share_name=${var_name:7}
    share_conf=${!var_name}
    custom_conf_path="${SAMBA_CUSTOM_CONF_DIR}/${share_name}.conf"

    echo "${share_conf}" > "${custom_conf_path}"
    echo "include = ${custom_conf_path}" >> ${SAMBA_CONF}
  done <<< "${shares_list}"
fi

# create groups
groups_list="$(compgen -e | grep ^group_name_ | sort -V)"
if [ -n "${groups_list}" ]; then
  while read var_name; do
    group_no=${var_name:11}
    gid_var_name="group_gid_${group_no}"

    group_name=${!var_name}
    gid=${!gid_var_name}

    eval_cmd="groupadd"
    if [ -n "${gid}" ]; then
      eval_cmd="${eval_cmd} -g ${gid}"
    fi
    eval_cmd="${eval_cmd} ${group_name}"

    eval "${eval_cmd}"
  done <<< "${groups_list}"
fi

# create users
users_list="$(compgen -e | grep ^user_name_ | sort -V)"
if [ -n "${users_list}" ]; then
  while read var_name; do
    user_no=${var_name:10}
    uid_var_name="user_uid_${group_no}"
    group_var_name="user_group_${group_no}"
    groups_var_name="user_groups_${group_no}"

    user_name=${!var_name}
    uid=${!uid_var_name}
    group=${!group_var_name}
    groups=${!groups_var_name}

    eval_cmd="useradd"
    if [ -n "${uid}" ]; then
      eval_cmd="${eval_cmd} -u ${uid}"
    fi
    if [ -n "${group}" ]; then
      eval_cmd="${eval_cmd} -g ${group}"
    elif [ $(getent group "${user_name}") ]; then
      eval_cmd="${eval_cmd} -g ${user_name}"
    fi
    if [ -n "${groups}" ]; then
      eval_cmd="${eval_cmd} -G ${groups}"
    fi
    eval_cmd="${eval_cmd} ${user_name}"
    
    eval "${eval_cmd}"
  done <<< "${users_list}"
fi

# create samba users
samba_users_list="$(compgen -e | grep ^samba_user_name_ | sort -V)"
if [ -n "${samba_users_list}" ]; then
  while read var_name; do
    user_no=${var_name:16}
    user_pass_var_name="samba_user_pass_${user_no}"

    user_name=${!var_name}
    user_pass=${!user_pass_var_name}

    (echo "${user_pass}"; echo "${user_pass}") | smbpasswd -sa ${user_name}
  done <<< "${samba_users_list}"
fi

# create directories
dirs_list="$(compgen -e | grep ^dir_path_ | sort -V)"
if [ -n "${dirs_list}" ]; then
  while read var_name; do
    dir_no=${var_name:9}
    mode_var_name="dir_mode_${dir_no}"
    owner_var_name="dir_owner_${dir_no}"
    group_var_name="dir_group_${dir_no}"

    path=${!var_name}
    mode=${!mode_var_name}
    owner=${!owner_var_name}
    group=${!group_var_name}

    mkdir -p "${path}"
    chmod "${mode}" "${path}"

    if [ -n "${owner}" ]; then
      chown "${owner}": "${path}"
    fi
    if [ -n "${group}" ]; then
      chown :"${group}" "${path}"
    fi
  done <<< "${dirs_list}"
fi

service nmbd start
smbd -FS < /dev/null
