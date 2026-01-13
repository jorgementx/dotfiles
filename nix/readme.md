## Configure files in proper routes:

```bash
cd /etc/nix && sudo ln -s ~/Projects/dotfiles/nix/nix.conf .
cd ~/.config && ln -s ~/Projects/dotfiles/nix/nixos .
```

### Useful commands

#### Generations
```bash
# For standalone home-manager installation
home-manager switch
home-manager generations
home-manager switch --generation 89

# For nixos and switching home-manager as module
sudo nixos-rebuild switch
```

#### Updating
```bash
nix flake update --flake ~/Projects/dotfiles/nix/nixos
nix-channel --update
```

#### Collecting garbage
```bash
nix-collect-garbage -d
```


### Useful resources

- [NixOS & Flakes Book](https://nixos-and-flakes.thiscute.world)
- [Nix Packages](https://search.nixos.org/packages)
- [Home-manager options](https://home-manager-options.extranix.com/)
- [Install specific version of nix package](https://lazamar.co.uk/nix-versions/)
- Launcher plugins: [raycast](https://www.raycast.com/aiotter/nixpkgs-search), [vicinae](https://github.com/vicinaehq/extensions/tree/main/extensions/nix) (This one is better than the raycast one)
- [Devenv](https://devenv.sh/)
