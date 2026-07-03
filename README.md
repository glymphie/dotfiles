# dotfiles

My personal Linux configuration files, managed with GNU Stow.

## Requirements

- Git
- GNU Stow

## Installation

Clone the repository:

```sh
git clone https://github.com/glymphie/dotfiles.git
cd dotfiles
```

Link every package into your home directory:

```sh
stow -t "$HOME" */
```

To install a single package:

```sh
stow -t "$HOME" zsh
```

To remove a package:

```sh
stow -D -t "$HOME" zsh
```

To re-stow a package after making changes:

```sh
stow -R -t "$HOME" zsh
```

## Repository Structure

Each top-level directory is a GNU Stow package.

| Package     | Description                       |
| ----------- | --------------------------------- |
| `aliasrc`   | Shell aliases                     |
| `dunst`     | Notification daemon               |
| `ghostty`   | Ghostty terminal configuration    |
| `git`       | Git configuration                 |
| `hyprland`  | Hyprland compositor configuration |
| `mpd`       | Music Player Daemon               |
| `neovim`    | Neovim configuration              |
| `npm`       | npm configuration                 |
| `python`    | Python configuration              |
| `rmpc`      | rmpc configuration                |
| `rofi`      | Application launcher              |
| `swappy`    | Screenshot annotation tool        |
| `tmux`      | tmux configuration                |
| `user-dirs` | XDG user directory configuration  |
| `waybar`    | Waybar configuration              |
| `wget`      | wget configuration                |
| `zathura`   | Zathura PDF viewer                |
| `zsh`       | Zsh shell configuration           |

## Development

This repository uses `pre-commit` with `gitleaks` to help prevent committing secrets.

Install the Git hooks once after cloning:

```sh
pre-commit install
```

Run the hooks manually on the entire repository:

```sh
pre-commit run --all-files
```
