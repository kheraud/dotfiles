# Personal dotfiles and applications

The dotfiles and applications added here are provisioned with Ansible. Due to a lack of time, these playbooks only apply to `Debian` based distributions.

## Installation

The default `hosts` file target localhost. If you want to target other hosts, edit this file.

Then edit `host_vars/*.yml` with custom settings (`host_vars/localhost.yml` is a good start)

```shell
$ sudo apt install ansible
$ ansible-playbook -K -i hosts site.yml
```

## Content of the playbooks

The global `site.yml` playbook imports all the other playbooks :

1. minimal_tools.yml
    - curl
    - git
    - htop
2. shell.yml
    - zsh
    - oh-my-zsh
    - set appropriate locales
    - terminal fonts
    - tmux
    - fd
    - fzf
    - bat
    - exa
    - ripgrep
3. tools.yml
    - python3
    - make
    - gvm
    - nvm
    - rsync
    - neovim
    - mlocate
    - lm_sensors
    - ffmpeg
    - gpg
    - docker
    - kubectl
    - virtualbox
    - minikube
    - helm
4. gnome.yml
    - dconf
    - keybindings
    - tweaks
5. desktop.yml
    - desktop fonts
    - urxvt
    - firefox
    - vlc
    - vscode
6. extended_desktop.yml
    - libreoffice
    - gimp
    - gparted
    - thunderbird
    - transmission
    - boostnote
    - dropbox
