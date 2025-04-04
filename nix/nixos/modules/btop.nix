{ config, pkgs, ...}: {
  programs.btop = {
    enable = true;
    settings = {
      color_theme = "ayu";
      theme_background = false;
      vim_keys = true;
    };
  };
}