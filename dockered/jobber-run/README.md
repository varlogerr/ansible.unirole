Run jobber in docker container.

Docker hub: https://hub.docker.com/r/blacklabelops/jobber  
Github: https://github.com/blacklabelops-legacy/jobber-cron

Usage
```
---
# ...
  roles:
  - role: dockered/jobber-run
    dockered_jobber_env: # optional. defaults to {}
      JOB_NAME1: Dummy
      JOB_COMMAND1: /bin/bash -c "ls -la"
      # sec min hour month_day month week_day
      JOB_TIME1: "* * */12 * * *"
    dockered_jobber_container_name: myjobber # optional. defaults to "{{xfacts.system.ansible_managed_prefix}}-jobber"
    dockered_jobber_version: v1.2 # optional. defaults to v1.2
    dockered_jobber_restart_policy: always # optional. defaults to always
    dockered_jobber_network_mode: host # optional. defaults to host
    dockered_jobber_ports: [] # optional. defaults to []
    dockered_jobber_volumes: [] # optional. defaults to []
# ...
```
