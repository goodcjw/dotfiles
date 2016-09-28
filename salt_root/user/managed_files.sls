{{ grains.homedir }}/.config/terminator:
  file.directory:
    - user: {{ grains.user }}
    - group: {{ grains.group }}
    - mode: 750
    - makedirs: True
    - recurse:
      - user
      - group
      - mode
{{ grains.homedir }}/.config/terminator/config:
  file.managed:
    - source: salt://user/managed_files/terminator.conf.jinja
    - user: {{ grains.user }}
    - group: {{ grains.group }}
    - mode: 640
    - template: jinja
{{ grains.homedir }}/.emacs:
  file.managed:
    - source: salt://user/managed_files/emacs.el
    - user: {{ grains.user }}
    - group: {{ grains.group }}
    - mode: 640
{{ grains.homedir }}/.gitconfig:
  file.managed:
    - source: salt://user/managed_files/gitconfig
    - user: {{ grains.user }}
    - group: {{ grains.group }}
    - mode: 640
    - template: jinja
{{ grains.homedir }}/.xmonad:
  file.directory:
    - user: {{ grains.user }}
    - group: {{ grains.group }}
    - mode: 750
    - makedirs: True
    - recurse:
      - user
      - group
      - mode
{{ grains.homedir }}/.xmonad/xmonad.hs:
  file.managed:
    - source: salt://user/managed_files/xmonad.hs.jinja
    - user: {{ grains.user }}
    - group: {{ grains.group }}
    - mode: 640
    - template: jinja
{{ grains.homedir }}/.xmodmaprc:
  file.managed:
    - source: salt://user/managed_files/xmodmap
    - user: {{ grains.user }}
    - group: {{ grains.group }}
    - mode: 640
{{ grains.homedir }}/.screenrc:
  file.managed:
    - source: salt://user/managed_files/screenrc
    - user: {{ grains.user }}
    - group: {{ grains.group }}
    - mode: 640
{{ grains.homedir }}/.zshrc:
  file.managed:
    - source: salt://user/managed_files/zshrc
    - user: {{ grains.user }}
    - group: {{ grains.group }}
    - mode: 640
{{ grains.homedir }}/.coffeelint.json:
  file.managed:
    - source: salt://user/managed_files/coffeelint.json
    - user: {{ grains.user }}
    - group: {{ grains.group }}
    - mode: 640
    - template: jinja
{{ grains.homedir }}/.local/share/fonts:
  file.directory:
    - user: {{ grains.user }}
    - group: {{ grains.group }}
    - mode: 750
    - makedirs: True
    - recurse:
      - user
      - group
      - mode
{{ grains.homedir }}/.local/share/fonts/TerminusTTF.ttf:
  file.managed:
    - source: salt://user/managed_files/terminus-ttf/TerminusTTF-4.40.1.ttf
    - user: {{ grains.user }}
    - group: {{ grains.group }}
    - mode: 640
{{ grains.homedir }}/.local/share/fonts/TerminusTTF-Bold.ttf:
  file.managed:
    - source: salt://user/managed_files/terminus-ttf/TerminusTTF-Bold-4.40.1.ttf
    - user: {{ grains.user }}
    - group: {{ grains.group }}
    - mode: 640
{{ grains.homedir }}/.local/share/fonts/TerminusTTF-Italic.ttf:
  file.managed:
    - source: salt://user/managed_files/terminus-ttf/TerminusTTF-Italic-4.40.1.ttf
    - user: {{ grains.user }}
    - group: {{ grains.group }}
    - mode: 640
{{ grains.homedir }}/.local/share/fonts/TerminusTTF-Bold Italic.ttf:
  file.managed:
    - source: salt://user/managed_files/terminus-ttf/TerminusTTF-Bold Italic-4.40.1.ttf
    - user: {{ grains.user }}
    - group: {{ grains.group }}
    - mode: 640
/usr/share/themes/Emacs/gtk-2.0-key/gtkrc:
  file.managed:
    - source: salt://user/managed_files/gtkrc
    - user: root
    - group: root
    - mode: 644
