# Personal dotfiles and applications

The dotfiles and applications added here are provisioned with Ansible. Due to a lack of time, these playbooks **only apply to `Debian` based distributions**.

## Installation

The default `hosts` file targets `localhost`. If you want to target other hosts, edit this file.

Then edit `host_vars/*.yml` with custom settings (`host_vars/localhost.yml` is a good start)

```shell
$ sudo apt install ansible
$ ansible-playbook -K -i hosts site.yml
```

## Content of the playbooks

The global `site.yml` playbook imports all the other playbooks :

1. `minimal_tools.yml`
    - [cURL](https://linux.die.net/man/1/curl)
    - [Git](https://git-scm.com/)
    - [htop](https://github.com/htop-dev/htop)
2. `shell.yml`
    - [Zsh](https://www.zsh.org)
    - [Oh-My-Zsh](https://github.com/ohmyzsh/ohmyzsh)
    - set appropriate [locales](https://linux.die.net/man/1/locale)
    - [Powerline fonts](https://github.com/powerline/fonts)
    - [Tmux](https://leanpub.com/the-tao-of-tmux/read)
    - [fd](https://github.com/sharkdp/fd)
    - [fzf](https://github.com/junegunn/fzf)
    - [bat](https://github.com/sharkdp/bat)
    - [exa](https://github.com/ogham/exa)
    - [ripgrep](https://github.com/BurntSushi/ripgrep)
3. `tools.yml`
    - [Python](https://www.python.org)
    - [Make](https://linux.die.net/man/1/make)
    - [gvm](https://github.com/moovweb/gvm)
    - [nvm](https://github.com/nvm-sh/nvm)
    - [rsync](https://rsync.samba.org)
    - [Neovim](https://github.com/neovim/neovim)
    - [mlocate](https://linux.die.net/man/5/mlocate.db)
    - [lm sensors](https://github.com/lm-sensors/lm-sensors)
    - [FFmpeg](https://ffmpeg.org/ffmpeg.html)
    - [GPG](https://gnupg.org/gph/en/manual.html)
    - [Docker](https://www.docker.com/)
    - [kubectl](https://kubernetes.io/docs/reference/kubectl)
    - [VirtualBox](https://www.virtualbox.org)
    - [minikube](https://github.com/kubernetes/minikube)
    - [Helm](https://github.com/helm/helm)
    - [topydo](https://github.com/topydo/topydo)
4. `gnome.yml`
    - [dconf](https://wiki.gnome.org/Projects/dconf)
    - [My personal keybindings](roles/gnome/files)
    - [Tweaks](https://wiki.gnome.org/action/show/Apps/Tweaks?action=show&redirect=Apps%2FGnomeTweakTool)
5. `desktop.yml`
    - desktop fonts
        - ttf-mscorefonts
        - fonts-crosextra-carlito
        - fonts-crosextra-caladea
        - [Extra google fonts](roles/desktop_fonts/defaults/main.yml)
    - [urxvt](https://linux.die.net/man/1/urxvt)
    - [Firefox](https://www.mozilla.org/fr/firefox/new/)
    - [VLC](https://www.videolan.org/vlc/)
    - [VSCode](https://code.visualstudio.com/)
6. `extended_desktop.yml`
    - [LibreOffice](https://www.libreoffice.org/)
    - [Gimp](https://www.gimp.org/)
    - [GParted](https://gparted.org/)
    - [Thunderbird](https://www.thunderbird.net)
    - [Transmission](https://transmissionbt.com/)
    - [Boostnote](https://github.com/BoostIO/Boostnote)
    - [Dropbox](https://www.dropbox.com)
