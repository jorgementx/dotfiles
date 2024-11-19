{ config, pkgs, ...}: {
  programs.atuin = {
    enable = true;
    enableZshIntegration = true;
    flags = [
        "--disable-up-arrow"
    ];
    settings = {
        auto_sync = false;
        # sync_frequency = "5m";
        # sync_address = "https://api.atuin.sh";
        # search_mode = "prefix";
    };
  };
}
