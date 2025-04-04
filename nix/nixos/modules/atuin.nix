{ config, pkgs, ...}: {
  programs.atuin = {
    enable = true;
    enableZshIntegration = true;
    flags = [
        "--disable-up-arrow"
    ];
    settings = {
        # configuration options: https://docs.atuin.sh/configuration/config
        keymap_mode = "auto";
        enter_accept = true;
    };
  };
}
