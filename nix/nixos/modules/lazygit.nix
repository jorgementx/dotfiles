{ config, pkgs, ...}: {
  programs.lazygit = {
    enable = true;
    settings = {
      promptToReturnFromSubprocess = false;
      gui.showIcons = true;
      services = {
        "dev2.purpleblob.net" = "gitlab:dev2.purpleblob.net";
      };
    };
  };
}
