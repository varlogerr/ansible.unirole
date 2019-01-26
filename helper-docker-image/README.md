Build docker image

Demo
```
# ...
  roles:
  - role: helper-docker-image
    helper_docker_image: # required
      # image name, required
      name: localhost/myimage
      # local absolute path to image src, required.
      local_src: "/usr/local/src/mybook/roles/myrole/files/myimage"
      # remote path to copy to and use from to build image, required
      remote_src: "/usr/local/src/{{ xfacts.system.ansible_managed_prefix }}/myimage-src"
      # remote file for image src hash, optional.
      # defaults to "{{ helper_docker_image.remote_src }}.checksum"
      src_hash_file: "/usr/local/src/{{ xfacts.system.ansible_managed_prefix }}/myimage.txt"
      # dockerfile name, optional. defaults to "Dockerfile"
      dockerfile: MyDockerfile
# ...
```
