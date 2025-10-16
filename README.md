## General settings (do not trust too much I don't update this often)

- Cursor: [Bibata Modern Classic](https://github.com/ful1e5/Bibata_Cursor)
- Font: Rodin Pro
- thunderbird theme: on progress
- Gnome theme: [Canta](https://github.com/vinceliuice/Canta-theme) + [Tela icon theme (yellow version)](https://github.com/vinceliuice/Tela-icon-theme)
- Gnome extensions (version 42):
  - [User themes](https://extensions.gnome.org/extension/19/user-themes/)
  - [Desktop clock](https://extensions.gnome.org/extension/5156/desktop-clock/)
  - [Pop Shell](https://github.com/pop-os/shell)
  - [Color Picker](https://extensions.gnome.org/extension/3396/color-picker/)
  - [Clipboard Indicator](https://extensions.gnome.org/extension/779/clipboard-indicator/)
  - [Rounded Window Corners](https://extensions.gnome.org/extension/5237/rounded-window-corners/)
- Gnome shortcuts (yet to come)
- nvim: default lazyvim for the moment
- vscode theme: cobalt2
- [Windows keyboard layout](https://github.com/thomasfaingnaert/win-us-intl-altgr)

## Project structure:

> [!NOTE]
> Marked with a `*` the ones that I actually actively use.

> [!TIP]
> What I do to keep this configurations always synced with this repo is creating a symbolic link from this repo's file to the proper directory in my system.
> Linux example: `cd ~/.config/ghostty && ln -s ~/Projects/dotfiles/ghostty/config .`

```
│   README.md
│
├───AntiMicroX
│       anki.gamecontroller.amgp
│
├───fish
│       fish_plugins
│       fish_variables
│
├───ghostty *
│       config
│
├───gtk-3.0
│       gtk.css
│
├───hyprland
│   │   README.md
│   │
│   └───hypr
│       └───custom
│               env.conf
│               execs.conf
│               general.conf
│               keybinds.conf
│               rules.conf
│
├───k9s *
│   │   config.yaml
│   │   plugins.yaml
│   │
│   └───skins
│           dracula.yaml
│
├───komorebi *
│       komorebi.ahk
│       komorebi.json
│
├───lazygit *
│       config.yml
│
├───lazyvim
│       keymaps.lua
│
├───mpv *
│   │   input.conf
│   │   mpv.conf
│   │
│   ├───script-opts
│   │       subs2srs.conf
│   │       sub_pause.conf
│   │
│   └───scripts
│           autosub.lua
│
├───nix *
│   │   nix.conf
│   │
│   └───nixos
│       │   configuration.nix
│       │   flake.lock
│       │   flake.nix
│       │   home.nix
│       │
│       ├───home
│       │       default.nix
│       │       personal.nix
│       │       work.nix
│       │
│       └───modules
│               atuin.nix
│               btop.nix
│               k9s.nix
│               lazygit.nix
│               mpv.nix
│               neovim.nix
│               translate.nix
│               zsh.nix
│
├───obsidian
│       .gitkeep
│
├───oh-my-zsh
│       .profile *
│       .zshrc
│
├───PowerShell *
│       Microsoft.PowerShell_profile.ps1
│
├───thunderbird-nier
│       image_cropped.png
│       image_full.png
│       manifest.json
│       userChrome.css
│
├───tmux
│       .gitkeep
│       .tmux.conf
│
├───vscode *
│       keybindings.json
│       settings.json
│
└───wallpapers
        howsmovingcastle.jpg
        kiminonawa.jpg
        suzume.jpg
```
