# Jiwen 'Steve' Cai's personal dotfiles

Warning: don't run `setup.sh` unless you want to use jwcai's own flavor of
Linux setup.

## Dependencies
I tends to use [salt](https://docs.saltstack.com) to manage all dotfiles
automatically and here is how to install it:

First, install `pip`, and assuming you are on Ubuntu.

```
$ sudo apt-get install python-pip
```

Using `pip` to install up-to-date salt, this step is platform agnostic.

```
$ sudo pip install salt
$ salt-call version
salt-call 2016.3.3 (Boron)
```
