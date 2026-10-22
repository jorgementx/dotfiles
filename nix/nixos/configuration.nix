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

  virtualisation.docker = {
    enable = true;
    rootless.enable = true;
    rootless.setSocketVariable = true;
  };
  # users.users.jorge.extraGroups = [ "docker" ]; # I'm currently using a rootless setup for docker so this is not needed anymore

  # virtualisation.podman = {
  #   enable = true;
  #   dockercompat = true;
  #   dockersocket.enable = true;
  # };

  programs.zsh.enable = true;
  users.users.jorge.shell = pkgs.zsh;

  # services.k3s = {
  #   enable = true;
  #   role = "server";
  #   extraflags = tostring [
  #     "--write-kubeconfig-mode=0644"
  #   ];
  # };
  # environment.variables.kubeconfig = "/etc/rancher/k3s/k3s.yaml";

  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      nspr
      nss
      glib
      dbus
      expat
      cups
      alsa-lib
      atk
      at-spi2-atk
      at-spi2-core
      libdrm
      libgbm
      mesa
      libxkbcommon
      pango
      cairo
      udev
      xorg.libX11
      xorg.libXcomposite
      xorg.libXdamage
      xorg.libXext
      xorg.libXfixes
      xorg.libXrandr
      xorg.libxcb
    ];
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

  # Limit the number of generations to keep
  boot.loader.systemd-boot.configurationLimit = 10;
  # boot.loader.grub.configurationLimit = 10;

  # Perform garbage collection weekly to maintain low disk usage
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "-d";
    # options = "--delete-older-than 7d";
  };

  # Optimize storage
  # You can also manually optimize the store via:
  #    nix-store --optimise
  # Refer to the following link for more details:
  # https://nixos.org/manual/nix/stable/command-ref/conf-file.html#conf-auto-optimise-store
  nix.settings.auto-optimise-store = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
