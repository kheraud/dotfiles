# Personal dotfiles and applications

The dotfiles and applications added here are provisioned with Ansible.

## Prerequisites

- Due to a lack of time, this playbook **only applies to `Ubuntu` >= 24.04 distribution**.
- [Poetry](https://github.com/python-poetry/poetry) `>= 1.1.0`

## Installation

The default `hosts` file targets `localhost`. If you want to target
other hosts, edit this file.

Then edit `host_vars/*.yml` with custom settings
(`host_vars/localhost.yml` is a good start).

```shell
poetry install && \
poetry run ansible-playbook -K -i hosts site.yml
```

## Content of the playbooks

The global `site.yml` playbook plays the following roles :

- `shell`
  - custom [locales](https://linux.die.net/man/1/locale)
  - [Git](https://git-scm.com/)
  - [Zsh](https://www.zsh.org)
  - [Oh-My-Zsh](https://github.com/ohmyzsh/ohmyzsh)
  - [Some Nerd fonts](https://github.com/ryanoasis/nerd-fonts)
  - [Tmux](https://leanpub.com/the-tao-of-tmux/read)
  - [autojump](https://github.com/wting/autojump)
  - [fd](https://github.com/sharkdp/fd)
  - [fzf](https://github.com/junegunn/fzf)
  - [bat](https://github.com/sharkdp/bat)
  - [eza](https://github.com/eza-community/eza)
  - [ripgrep](https://github.com/BurntSushi/ripgrep)
  - [fx](https://github.com/antonmedv/fx)
  - [jq](https://github.com/stedolan/jq) (redundant with fx)
  - [progress](https://github.com/Xfennec/progress)
- `tools`
  - [Neovim](https://github.com/neovim/neovim)
  - [htop](https://github.com/htop-dev/htop)
  - [Glances](https://github.com/nicolargo/glances)
  - [HTTPie](https://github.com/httpie/httpie)
  - [the silver searcher](https://github.com/ggreer/the_silver_searcher)
  - [rsync](https://rsync.samba.org)
  - [plocate](hhttps://plocate.sesse.net/)
  - [lm-sensors](https://github.com/lm-sensors/lm-sensors)
  - [GPG](https://gnupg.org/gph/en/manual.html)
  - [FFmpeg](https://ffmpeg.org/ffmpeg.html)
  - [ngrok](https://ngrok.com)
  - [asdf](https://asdf-vm.com)
  - [docker](https://docs.docker.com/engine/)
- `programming` (heavily relying on asdf tool)
  - [GCC / G++](https://gcc.gnu.org/)
  - [Make](https://linux.die.net/man/1/make)
  - [Cheat.sh](https://github.com/chubin/cheat.sh)
  - [Tldr](https://github.com/tldr-pages/tldr)
  - [Python](https://www.python.org)
  - [Nodejs](https://nodejs.org/en/)
  - [Golang](https://golang.org/)
  - [yarn](https://yarnpkg.com/)
  - [java](https://www.java.com/fr/)
  - [scala](https://scala-lang.org/)
  - [Github cli](https://cli.github.com/)
  - [kubectl](https://kubernetes.io/docs/reference/kubectl)
  - [kubectx / kubens](https://github.com/ahmetb/kubectx#manual)
  - [Minikube](https://github.com/kubernetes/minikube)
  - [kind](https://github.com/kubernetes-sigs/kind)
  - [Helm](https://github.com/helm/helm)
  - [terraform](https://www.terraform.io/docs/cli/index.html)
  - [vault](https://www.vaultproject.io/docs/commands)
  - [AWS cli](https://aws.amazon.com/fr/cli/)
- `desktop`
  - desktop fonts
    - ttf-mscorefonts
    - fonts-crosextra-carlito
    - fonts-crosextra-caladea
    - [Extra google fonts](roles/desktop_fonts/files)
  - [Alacritty](https://github.com/alacritty/alacritty)
  - [Firefox](https://www.mozilla.org/fr/firefox/new/)
  - [VLC](https://www.videolan.org/vlc/)
  - [VSCode](https://code.visualstudio.com/) with [these extensions](host_vars/localhost.yml)
  - [MuPDF](https://mupdf.com/)
  - [Veracrypt](https://github.com/veracrypt/VeraCrypt)
  - [LibreOffice](https://www.libreoffice.org/)
  - [Gimp](https://www.gimp.org/)
  - [GParted](https://gparted.org/)
  - [Transmission](https://transmissionbt.com/)

## Install a subset

You can use [Ansible tags](https://docs.ansible.com/ansible/latest/user_guide/playbooks_tags.html#selecting-or-skipping-tags-when-you-run-a-playbook)
to target some tools or group of tools. You will have to dig in the
`./**/tasks/*.yml` files to pick the tag namings.

Example, install only `shell` tools :

```shell
poetry install && \
poetry run ansible-playbook -K -i hosts --tags "shell" site.yml
```
