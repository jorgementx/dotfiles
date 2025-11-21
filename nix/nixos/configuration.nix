# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).
# NixOS-WSL specific options are documented on the NixOS-WSL repository:
# https://github.com/nix-community/NixOS-WSL
{
  config,
  lib,
  pkgs,
  ...
}@inputs:
{
  nix.settings.trusted-users = [
    "root"
    "jorge"
  ];
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  wsl.enable = true;
  wsl.defaultUser = "jorge";
  wsl.startMenuLaunchers = true;
  wsl.wslConf.network.generateResolvConf = false;

  virtualisation.docker.enable = true;
  virtualisation.podman.enable = false;
  programs.zsh.enable = true;
  users.users.jorge.extraGroups = [ "docker" ];
  users.users.jorge.shell = pkgs.zsh;

  programs.nix-ld = {
    enable = true;
  };

  environment.variables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  environment.systemPackages = [
    pkgs.wget
    pkgs.neovim
  ];

  networking.nameservers = [
    "1.1.1.1"
    "8.8.8.8"
  ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
