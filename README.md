# Personal dotfiles and applications

The dotfiles and applications added here are provisioned with Ansible.
Due to a lack of time, these playbooks **only apply to `Ubuntu` >= 20.04 distribution**.

## Installation

The default `hosts` file targets `localhost`. If you want to target
other hosts, edit this file.

Then edit `host_vars/*.yml` with custom settings
(`host_vars/localhost.yml` is a good start).

```shell
pipenv install && pipenv shell
ansible-playbook -K -i hosts site.yml
```

## Content of the playbooks

The global `site.yml` playbook plays the following roles :

- `shell`
  - custom [locales](https://linux.die.net/man/1/locale)
  - [Git](https://git-scm.com/)
  - [Zsh](https://www.zsh.org)
  - [Oh-My-Zsh](https://github.com/ohmyzsh/ohmyzsh)
  - [Roboto Mono Nerd fonts](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/RobotoMono)
  - [Tmux](https://leanpub.com/the-tao-of-tmux/read)
  - [autojump](https://github.com/wting/autojump)
  - [fd](https://github.com/sharkdp/fd)
  - [fzf](https://github.com/junegunn/fzf)
  - [bat](https://github.com/sharkdp/bat)
  - [exa](https://github.com/ogham/exa)
  - [ripgrep](https://github.com/BurntSushi/ripgrep)
  - [fx](https://github.com/antonmedv/fx)
- `programming`
  - [GCC / G++](https://gcc.gnu.org/)
  - [Make](https://linux.die.net/man/1/make)
  - [GVM](https://github.com/moovweb/gvm)
  - [nvm](https://github.com/nvm-sh/nvm)
  - [Python](https://www.python.org)
  - [Cheat.sh](https://github.com/chubin/cheat.sh)
- `tools`
  - [Neovim](https://github.com/neovim/neovim)
  - [htop](https://github.com/htop-dev/htop)
  - [Glances](https://github.com/nicolargo/glances)
  - [HTTPie](https://github.com/httpie/httpie)
  - [nnn](https://github.com/jarun/nnn)
  - [the silver searcher](https://github.com/ggreer/the_silver_searcher)
  - [rsync](https://rsync.samba.org)
  - [mlocate](https://linux.die.net/man/5/mlocate.db)
  - [lm-sensors](https://github.com/lm-sensors/lm-sensors)
  - [GPG](https://gnupg.org/gph/en/manual.html)
  - [FFmpeg](https://ffmpeg.org/ffmpeg.html)
  - [todo.cli](https://github.com/todotxt/todo.txt-cli)
  - [topydo](https://github.com/topydo/topydo)
  - [ngrok](https://ngrok.com/)
- `docker / kube`
  - [docker](https://docs.docker.com/engine/)
  - [docker-compose](https://docs.docker.com/compose/)
  - [kubectl](https://kubernetes.io/docs/reference/kubectl)
  - [kubectx / kubens](https://github.com/ahmetb/kubectx#manual)
  - [Helm](https://github.com/helm/helm)
  - [Minikube](https://github.com/kubernetes/minikube)
- `gnome` [if gnome-shell is installed]
  - [Tweaks](https://wiki.gnome.org/action/show/Apps/Tweaks)
  - For my personal keybindings and extensions :
    - Install [gnome-shell-extensions-sync](https://github.com/oae/gnome-shell-extensions-sync)
    - Use [my gist](https://gist.github.com/kheraud/7fa0b1083fa5e179b796c97e390cffc2) to setup extension
  - @TODO Add `numix` theme in gnome
- `desktop`
  - desktop fonts
    - ttf-mscorefonts
    - fonts-crosextra-carlito
    - fonts-crosextra-caladea
    - [Extra google fonts](roles/desktop_fonts/files)
  - [urxvt](https://linux.die.net/man/1/urxvt)
  - [Firefox](https://www.mozilla.org/fr/firefox/new/)
  - @TODO Install `chrome-gnome-shell`
  - [VLC](https://www.videolan.org/vlc/)
  - [VSCode](https://code.visualstudio.com/)
- `extended_desktop`
  - [LibreOffice](https://www.libreoffice.org/)
  - [Gimp](https://www.gimp.org/)
  - [GParted](https://gparted.org/)
  - [Transmission](https://transmissionbt.com/)
  - [Dropbox](https://www.dropbox.com)

(*) My personal keybindings could be replaced with : [gnome-shell-extensions-sync](https://extensions.gnome.org/extension/1486/extensions-sync/)
but the plugin [does not handle all my keybindings](https://github.com/oae/gnome-shell-extensions-sync/issues/21).

## Install a subset

You can use [Ansible tags](https://docs.ansible.com/ansible/latest/user_guide/playbooks_tags.html#selecting-or-skipping-tags-when-you-run-a-playbook)
to target some tools or group of tools. You will have to dig in the
`./**/tasks/*.yml` files to pick the tag namings.

Example, install only `shell` tools :

```shell
pipenv install && pipenv shell
ansible-playbook -K -i hosts --tags "shell" site.yml
```
