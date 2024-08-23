{ config, pkgs, ... }:

{
  nixpkgs.config.allowunfree = true;
  nixpkgs.config.allowUnfreePredicate = _: true;

  home = {
    username = "jorge";
    homeDirectory = "/home/jorge";
    stateVersion = "24.05";
    packages = [
      pkgs.anki
      pkgs.btop
      pkgs.cava
      pkgs.git
      pkgs.lazygit
      pkgs.mpv
      pkgs.obsidian
      pkgs.vim
      pkgs.vscode
      pkgs.google-chrome
    ];
    # Home Manager is pretty good at managing dotfiles. The primary way to manage
    # plain files is through 'home.file'.
    file = {
      # # Building this configuration will create a copy of 'dotfiles/screenrc' in
      # # the Nix store. Activating the configuration will then make '~/.screenrc' a
      # # symlink to the Nix store copy.
      # ".screenrc".source = dotfiles/screenrc;

      # # You can also set the file content immediately.
      # ".gradle/gradle.properties".text = ''
      #   org.gradle.console=verbose
      #   org.gradle.daemon.idletimeout=3600000
      # '';
    };

    # Home Manager can also manage your environment variables through
    # 'home.sessionVariables'. These will be explicitly sourced when using a
    # shell provided by Home Manager. If you don't want to manage your shell
    # through Home Manager then you have to manually source 'hm-session-vars.sh'
    # located at either
    #
    #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
    #
    # or
    #
    #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
    #
    # or
    #
    #  /etc/profiles/per-user/jorge/etc/profile.d/hm-session-vars.sh
    #
    sessionVariables = {
      EDITOR = "vim";
    };

  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userName = "jorgementx";
    userEmail = "jordims2000@gmail.com";
    extraConfig = {
      pull.rebase = false;
    };
  };

  # programs.fish = {
  #   enable = true;
  # };

  nix.gc = {
    automatic = true;
    options = "-d";
    frequency = "weekly";
  };
}
