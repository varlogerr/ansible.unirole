Demo usage after building the image
```
- name: run dockered samba
  docker_container:
    name: samba
    image: "{{ dockered_samba_image_name }}"
    state: started
    restart_policy: unless-stopped
    network_mode: bridge
    ports:
    - "445:445"
    volumes:
    - /:/app
    env:
      # create group
      group_name_1: sam
      group_gid_1: 1001 # optional
      # create user
      user_name_1: sam
      user_uid_1: 1001 # optional
      user_group_1: sam # optional
      user_groups_1: app # optional
      # create samba user
      samba_user_name_1: sam
      samba_user_pass_1: qwerty # optional
      # create directory
      dir_path_1: /app/Share
      dir_owner_1: sam # optional
      dir_group_1: sam # optional
      dir_mode_1: "0755" # optional
      # create share configuration
      shares_Share: |
        [Share]
          path = /app/Share
          guest ok = yes
          force user = sam
          force group = app
          create mask = 0664
          force create mode = 0664
          directory mask = 0775
          force directory mode = 0775
```
All numbered in the sample envs can be iterated, i.e. `group_name_1: groupone` and `group_name_2: grouptwo` will create `groupone` and `grouptwo` groups, `group_name_` prefix denotes meaning of the variable value. Same applies `shares_` prefix. Postprefix part of shares is mostly meaningless, serves for differing env variables and naming samba config files inside resulting image.  
Baked in global samba configuration `smb.conf`  
```
[global]
browsable = yes
writable = yes
read only = no
map to guest = Bad User
available = yes
allow insecure wide links = no
nt acl support = no
map archive = no
follow symlinks = yes
wide links = yes
hide dot files = no
```
Out of the box you have `app` user with uid `1000` and group `app` with gid `1000`.
