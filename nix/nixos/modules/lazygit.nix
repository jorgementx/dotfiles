{ config, pkgs, ... }:
{
  programs.lazygit = {
    enable = true;
    settings = {
      promptToReturnFromSubprocess = false;
      gui.showIcons = true;
      services = {
        "trumpf.ghe.com" = "github:trumpf.ghe.com";
      };
      customCommands = [
        {
          key = "C";
          command = "cz commit";
          description = "Commit with commitizen";
          context = "files";
          loadingText = "Opening commitizen";
          output = "terminal";
        }
        {
          key = "B";
          command = "cz bump";
          description = "Bump version with commitizen";
          context = "files";
          loadingText = "Opening commitizen";
          output = "terminal";
        }
        {
          key = "I";
          command = "cz init";
          description = "Initialize commitizen";
          context = "files";
          loadingText = "Opening commitizen";
          output = "terminal";
        }
      ];
    };
  };
}
