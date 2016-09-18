include:
  - user.managed_files

https://github.com/zsh-users/antigen.git:
  git.latest:
    - target: {{ grains.homedir }}/.antigen
