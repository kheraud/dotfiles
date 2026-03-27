# AGENTS.md — Dotfiles Ansible Playbook

This file provides guidance for agentic coding agents working in this repository.

---

## Repository Overview

This is an **Ansible playbook** that configures a personal Linux workstation (Ubuntu 24.04+). There is no application code, tests, or build output. All logic is expressed in YAML (Ansible tasks, roles, vars, templates).

Tool versions are managed by **uv** (Python) and **asdf** (system tools).

---

## Commands

### Install dependencies

```bash
uv sync
```

The PyPI index is a private registry. Ensure network access to it before running `uv sync`.

### Run the full playbook

```bash
uv run ansible-playbook -K -i hosts site.yml
```

### Run a single role or tool (by tag)

```bash
uv run ansible-playbook -K -i hosts --tags "shell" site.yml
uv run ansible-playbook -K -i hosts --tags "vscode" site.yml
uv run ansible-playbook -K -i hosts --tags "vscode,alacritty" site.yml
```

Role-level tags: `shell`, `tools`, `docker`, `programming`, `xfce`, `desktop`.

Tool-level tags (examples): `git`, `zsh`, `tmux`, `fzf`, `bat`, `eza`, `ripgrep`, `fd`, `neovim`, `asdf`, `alacritty`, `vscode`, `firefox`, `desktop_fonts`, `shell_fonts`, `rofi`.

See `site.yml` and each `roles/<role>/tasks/main.yml` for the full tag list.

### Lint (the only automated check)

```bash
uv run ansible-lint                  # lint everything
uv run ansible-lint roles/shell/     # lint a single role
```

No `.ansible-lint` config file exists — defaults run at the `production` profile. **All violations must be fixed; do not suppress them.**

### Dry run

```bash
uv run ansible-playbook -K -i hosts --check site.yml
```

---

## Pre-requisites Before Running

1. Copy the host vars template and fill in personal values:

   ```bash
   cp host_vars/localhost.dist.yml host_vars/localhost.yml
   # edit host_vars/localhost.yml — set at minimum shell_git_username
   # and shell_git_email
   ```

   `host_vars/localhost.yml` is gitignored. `localhost.dist.yml` is the committed template — keep it in sync with any new variables. `ansible.cfg` is also gitignored; do not commit it.

1. Platform: **Ubuntu >= 24.04** only. Enforced at runtime via `utils/tasks/filter_distribution.yml`.

---

## Repository Structure

```text
.
├── site.yml                  # Main playbook entry point
├── hosts                     # Inventory (localhost, local connection)
├── host_vars/
│   ├── localhost.dist.yml    # Committed variable template (public)
│   └── localhost.yml         # Personal values — GITIGNORED
└── roles/
    ├── utils/                # Pre-task utilities: apt cache, prerequisites,
    │                         #   env detection (no main.yml tasks)
    ├── shell/                # Zsh, git, tmux, fzf, bat, eza, ripgrep, etc.
    ├── tools/                # asdf, neovim, htop, sops, ngrok, ffmpeg, etc.
    ├── docker/               # Docker CE + user group
    ├── programming/          # asdf plugins + tldr
    ├── xfce/                 # XFCE desktop, Rofi, themes
    └── desktop/              # VSCode, Alacritty, Firefox, fonts, VLC, etc.
```

Role execution order matters: `tools` (installs `asdf`) must run before `programming` (which uses `asdf`).

Each role follows the standard layout: `defaults/`, `vars/`, `handlers/`, `tasks/`, `templates/`, `files/`. One task file per tool, imported by `main.yml`. `utils/tasks/main.yml` is intentionally empty — it is only called via `import_role: tasks_from:` in `site.yml` pre-tasks.

---

## Code Style Guidelines

### YAML formatting

- 2-space indentation throughout.
- Every file starts with `---` and ends with a trailing newline.
- Task files use `.yml`; handler files use `.yaml`.
- All YAML strings containing `:` or `{` must be quoted.

### FQCN — required for all modules

```yaml
# Correct
ansible.builtin.apt:
ansible.builtin.copy:
ansible.builtin.template:
ansible.builtin.get_url:
ansible.builtin.command:
ansible.builtin.shell:
ansible.builtin.blockinfile:
ansible.builtin.import_tasks:
ansible.builtin.include_tasks:
community.general.locale_gen:

# Wrong — fails ansible-lint
apt:
copy:
import_tasks:
```

### Variable naming — role prefix required

All variables in a role (defaults, vars, registered facts, set_facts) must be prefixed with the role name:

```yaml
# roles/shell/defaults/main.yml
shell_git_username: null
shell_oh_my_zsh_plugins: []

# roles/tools/vars/main.yml
tools_asdf_version: "0.16.2"

# roles/desktop/tasks/vscode.yml
register: desktop_vscode_installed_extensions
```

Cross-role variables use their **origin** role as prefix (e.g. `utils_is_xfce_installed` set by `utils`, read in `site.yml`).

### Task names

- Every task and play must have a `name`.
- Jinja2 expressions may only appear **at the end** of a name:

  ```yaml
  - name: "Install prerequisites for plugin {{ plugin_name }}"  # correct
  - name: "Install {{ plugin_name }} prerequisites"              # wrong
  ```

### `changed_when`

- Read-only `command`/`shell` tasks: `changed_when: false`
- Always-changing tasks: `changed_when: true`
- Conditional: use a string test, e.g.
  `changed_when: '"already added" not in result.stderr'`

### Handlers

Use handlers for side-effect actions (`fc-cache`, tmux reload, etc.). Do not use `when: result.changed` inline — convert to handlers instead. Exception: `ansible.builtin.meta: end_host` cannot be a handler; suppress with `# noqa: no-handler`. Handlers that run shell commands must set `changed_when: true`.

### File permissions

Always set `mode:` on `copy`, `get_url`, `template`, `file`, and `unarchive`:

```yaml
mode: 'u=rw,g=r'        # regular config files
mode: 'u=rwx,go=rx'     # executables and directories
```

### Privilege escalation

Use `become: true` **per task**, never at the play level.

### Jinja2 spacing

Always add spaces inside delimiters:

```yaml
src: "https://example.com/v{{ tools_asdf_version }}/file.tar.gz"  # correct
src: "https://example.com/v{{tools_asdf_version}}/file.tar.gz"    # wrong
```

### `include_tasks` for loops

Use `include_tasks` (dynamic) with the `apply: tags:` block when iterating over a list. Use `import_tasks` (static) for all fixed sub-task imports:

```yaml
- name: "Install asdf plugins"
  ansible.builtin.include_tasks:
    file: asdf_plugin.yml
    apply:
      tags: asdf_plugins
  loop: "{{ programming_asdf_plugins | dict2items }}"
  tags: asdf_plugins
```

When nesting loops, rename the inner loop variable with `loop_control: loop_var:` to avoid colliding with the outer `item`.

---

## Shell Config Injection Pattern

Roles inject shell config via `blockinfile` into:

- `~/.zshrc_pre` — before oh-my-zsh (locale exports, pre-plugin config)
- `~/.zshrc_post` — after oh-my-zsh (aliases, PATH additions, tool shims)

Always use a unique `marker` per role/purpose:

```yaml
marker: "# {mark} ANSIBLE MANAGED <role>-<purpose> BLOCK -->"
```

---

## Workflow for Changes

1. Edit role files.
1. Run `uv run ansible-lint roles/<role>/` — must pass with zero violations.
1. Run `uv run ansible-lint` — must pass with zero violations.
1. Commit: `fix(<role>): <description>` or `feat(<role>): <description>`.
