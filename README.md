# Personal dotfiles and applications

The dotfiles and applications added here are provisioned with Ansible. Due to a lack of time, these playbooks **only apply to `Ubuntu` >= 20.04 distribution**.

## Installation

The default `hosts` file targets `localhost`. If you want to target other hosts, edit this file.

Then edit `host_vars/*.yml` with custom settings (`host_vars/localhost.yml` is a good start)

```shell
sudo apt install ansible
ansible-playbook -K -i hosts site.yml
```

## Content of the playbooks

The global `site.yml` playbook plays the following roles :

- `shell`
  - [cURL](https://linux.die.net/man/1/curl)
  - personal [locales](https://linux.die.net/man/1/locale)
  - [Neovim](https://github.com/neovim/neovim)
  - [Git](https://git-scm.com/)
  - [Zsh](https://www.zsh.org)
  - [Oh-My-Zsh](https://github.com/ohmyzsh/ohmyzsh)
  - [Powerline fonts](https://github.com/powerline/fonts)
  - [Tmux](https://leanpub.com/the-tao-of-tmux/read)
  - [fd](https://github.com/sharkdp/fd)
  - [fzf](https://github.com/junegunn/fzf)
  - [bat](https://github.com/sharkdp/bat)
  - [exa](https://github.com/ogham/exa)
  - [ripgrep](https://github.com/BurntSushi/ripgrep)
- `prog.yml`
  - [GCC / G++](https://gcc.gnu.org/)
  - [Make](https://linux.die.net/man/1/make)
  - [gvm](https://github.com/moovweb/gvm)
  - [nvm](https://github.com/nvm-sh/nvm)
  - [Python](https://www.python.org)
  - [Cheat.sh](https://github.com/chubin/cheat.sh)
- `tools`
  - [mlocate](https://linux.die.net/man/5/mlocate.db)
  - [lm sensors](https://github.com/lm-sensors/lm-sensors)
  - [htop](https://github.com/htop-dev/htop)
  - [rsync](https://rsync.samba.org)
  - [GPG](https://gnupg.org/gph/en/manual.html)
  - [FFmpeg](https://ffmpeg.org/ffmpeg.html)
  - [Docker](https://www.docker.com/)
  - [kubectl](https://kubernetes.io/docs/reference/kubectl)
  - [kubectx / kubens](https://github.com/ahmetb/kubectx#manual)
  - [VirtualBox](https://www.virtualbox.org)
  - [minikube](https://github.com/kubernetes/minikube)
  - [Helm](https://github.com/helm/helm)
  - [topydo](https://github.com/topydo/topydo)
- `gnome`
  - [dconf](https://wiki.gnome.org/Projects/dconf)
  - [My personal keybindings](roles/gnome/files)
  - [Tweaks](https://wiki.gnome.org/action/show/Apps/Tweaks?action=show&redirect=Apps%2FGnomeTweakTool)
- `desktop`
  - desktop fonts
    - ttf-mscorefonts
    - fonts-crosextra-carlito
    - fonts-crosextra-caladea
    - [Extra google fonts](roles/desktop_fonts/files)
  - [urxvt](https://linux.die.net/man/1/urxvt)
  - [Firefox](https://www.mozilla.org/fr/firefox/new/)
  - [VLC](https://www.videolan.org/vlc/)
  - [VSCode](https://code.visualstudio.com/)
- `extended_desktop`
  - [LibreOffice](https://www.libreoffice.org/)
  - [Gimp](https://www.gimp.org/)
  - [GParted](https://gparted.org/)
  - [Thunderbird](https://www.thunderbird.net)
  - [Transmission](https://transmissionbt.com/)
  - [Boostnote](https://github.com/BoostIO/Boostnote)
  - [Dropbox](https://www.dropbox.com)
  - [Slack](https://slack.com)
