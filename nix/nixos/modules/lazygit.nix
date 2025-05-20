{ config, pkgs, ...}: {
  programs.lazygit = {
    enable = true;
    settings = {
      promptToReturnFromSubprocess = false;
      gui.showIcons = true;
      services = {
        "dev2.purpleblob.net" = "gitlab:dev2.purpleblob.net";
      };
      customCommands = [
        {
          key = "C";
          command = "cz commit";
          description = "commit with commitizen";
          context = "files";
          loadingText = "opening commitizen commit tool";
          subprocess = true;
        }
      ];
    };
  };
}
