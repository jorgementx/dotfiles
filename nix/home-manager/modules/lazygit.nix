{ config, pkgs, ...}: {
  programs.lazygit = {
    enable = true;
    settings = {
      promptToReturnFromSubprocess = false;
      gui.showIcons = true;
    };
  };
}
