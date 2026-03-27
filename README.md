# Personal dotfiles and applications

The dotfiles and applications added here are provisioned with Ansible.

## Prerequisites

- Due to a lack of time, this playbook **only applies to `Ubuntu` >= 24.04 distribution**.
- [uv](https://github.com/astral-sh/uv) `>= 0.4.25`

## Installation

The default `hosts` file targets `localhost`. If you want to target other hosts, edit this file.

Then edit `host_vars/*.yml` with custom settings (`host_vars/localhost.yml` is a good start).

```shell
uv sync && \
uv run ansible-playbook -K -i hosts site.yml
```

## Content of the playbooks

The global `site.yml` playbook plays the following roles :

- `utils` (pre-tasks, always run)
  - System prerequisites: `apt-transport-https`, `ca-certificates`, `curl`, `sudo`, `python3`, `xz-utils`

- `shell`
  - custom [locales](https://linux.die.net/man/1/locale)
  - [Git](https://git-scm.com/)
  - [git-delta](https://github.com/dandavison/delta) — syntax-highlighting diff pager
  - [git-extras](https://github.com/tj/git-extras)
  - [Zsh](https://www.zsh.org)
  - [Oh-My-Zsh](https://github.com/ohmyzsh/ohmyzsh) with [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
  - [Tmux](https://leanpub.com/the-tao-of-tmux/read) with [TPM](https://github.com/tmux-plugins/tpm)
  - [autojump](https://github.com/wting/autojump)
  - [direnv](https://github.com/direnv/direnv)
  - [fd](https://github.com/sharkdp/fd)
  - [fzf](https://github.com/junegunn/fzf)
  - [bat](https://github.com/sharkdp/bat)
  - [eza](https://github.com/eza-community/eza)
  - [ripgrep](https://github.com/BurntSushi/ripgrep)
  - [fx](https://github.com/antonmedv/fx)
  - [jq](https://github.com/stedolan/jq)
  - [progress](https://github.com/Xfennec/progress)

- `tools`
  - [asdf](https://asdf-vm.com)
  - [Neovim](https://github.com/neovim/neovim)
  - [htop](https://github.com/htop-dev/htop)
  - [Glances](https://github.com/nicolargo/glances)
  - [HTTPie](https://github.com/httpie/httpie)
  - [the silver searcher](https://github.com/ggreer/the_silver_searcher)
  - [rsync](https://rsync.samba.org)
  - [plocate](https://plocate.sesse.net/)
  - [lm-sensors](https://github.com/lm-sensors/lm-sensors)
  - [GPG](https://gnupg.org/gph/en/manual.html)
  - [Age](https://github.com/FiloSottile/age)
  - [Sops](https://github.com/getsops/sops)
  - [FFmpeg](https://ffmpeg.org/ffmpeg.html)
  - [ngrok](https://ngrok.com)

- `docker`
  - [Docker CE](https://docs.docker.com/engine/) (docker-ce, docker-ce-cli, containerd.io, buildx, compose v2)

- `programming` (heavily relying on asdf)
  - [GCC / G++](https://gcc.gnu.org/)
  - [Make](https://linux.die.net/man/1/make)
  - [Cheat.sh](https://github.com/chubin/cheat.sh)
  - [Tldr](https://github.com/tldr-pages/tldr)
  - [Many languages and CLI via asdf](./host_vars/localhost.dist.yml#L49)

- `xfce` (only applied when XFCE desktop environment is detected)
  - [Orchis GTK theme](https://github.com/vinceliuice/Orchis-theme)
  - [Numix icon theme](https://github.com/numixproject/numix-icon-theme)
  - [Rofi](https://github.com/davatorium/rofi) — application launcher
  - [wmctrl](https://sites.google.com/site/tstyblo/wmctrl) — window manager control
  - [xdotool](https://github.com/jordansissel/xdotool) — X11 automation
  - [move-to-next-monitor](https://github.com/jc00ke/move-to-next-monitor)

- `desktop`
  - desktop fonts
    - ttf-mscorefonts
    - fonts-crosextra-carlito
    - fonts-crosextra-caladea
    - [Extra Google fonts](roles/desktop/files/fonts)
  - [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts): RobotoMono, Iosevka Term, Hack, FiraCode, DejaVuSansM
  - [Alacritty](https://github.com/alacritty/alacritty)
  - [MuPDF](https://mupdf.com/)
  - [Nomacs](https://nomacs.org/)
  - [file-roller](https://gitlab.gnome.org/GNOME/file-roller) — archive manager
  - [Firefox](https://www.mozilla.org/fr/firefox/new/)
  - [Thunderbird](https://www.thunderbird.net/)
  - [VLC](https://www.videolan.org/vlc/)
  - [VSCode](https://code.visualstudio.com/) with [these extensions](./host_vars/localhost.dist.yml#L99)
  - [Veracrypt](https://github.com/veracrypt/VeraCrypt)
  - [LibreOffice](https://www.libreoffice.org/)
  - [Gimp](https://www.gimp.org/)
  - [GParted](https://gparted.org/)
  - [Transmission](https://transmissionbt.com/)
  - [Rhythmbox](https://wiki.gnome.org/Apps/Rhythmbox)

## Install a subset

You can use [Ansible tags](https://docs.ansible.com/ansible/latest/user_guide/playbooks_tags.html#selecting-or-skipping-tags-when-you-run-a-playbook) to target some tools or group of tools. You will have to dig in the `./**/tasks/*.yml` files to pick the tag namings.

Example, install only `shell` tools :

```shell
uv sync && \
uv run ansible-playbook -K -i hosts --tags "shell" site.yml
```

## TODO

- Add a msg at the end of asdf installs to list the tools and versions installed that are not listed in the conf
