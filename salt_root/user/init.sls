include:
  - user.managed_files

https://github.com/zsh-users/antigen.git:
  git.latest:
    - user: {{ grains.user }}
    - target: {{ grains.homedir }}/.antigen
