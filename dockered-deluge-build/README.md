Demo usage:
```
- name: dockered-deluge-build
  dockered_deluge_image_name: dockered-deluge # optional. defaults to "{{ xfacts.system.ansible_managed_prefix }}-deluge"
```

Demo usage after building the image
```
- name: run dockered deluge
  docker_container:
    name: deluge
    image: "{{ dockered_deluge_image_name }}"
    state: started
    restart_policy: unless-stopped
    network_mode: bridge
    ports:
    - "8112:8112"
    volumes:
    - "{{ xfacts.user.homedir }}/config/deluge:/app/.config"
    - "{{ xfacts.user.homedir }}/Downloads:/app/Downloads"
    - "{{ xfacts.user.homedir }}/Uploads:/app/Uploads"
    - "{{ xfacts.user.homedir }}/Mix:/app/Mix"
    env:
      # set app user uid and gid. optional, both default to 1000
      APP_USER_ID: 1001
      APP_GROUP_ID: 1001
      # create directories. optional
      dir_path_1: /app/Uploads
      dir_path_2: /app/Mix
```
All numbered in the sample envs can be iterated, i.e. `dir_path_1: /dir1` and `dir_path_1: /dir2` will create `/dir1` and `/dir2` directories, `dir_path_` prefix denotes meaning of the variable value. Postprefix part of shares is mostly meaningless, serves for differing env variables and naming samba config files inside resulting image.  
Out of the box you have group `app` with gid `1000` and `app` user with uid `1000` in `app` group. `/app/.config` and `/app/Downloads` directories are predefined in container
