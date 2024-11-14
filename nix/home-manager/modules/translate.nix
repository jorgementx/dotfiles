{ config, pkgs, ...}: {
  programs.translate-shell = {
      enable = true;
      settings = {
        hl = "en";
        tl = [
          "ko"
        ];
        verbose = true;
      };
  };
}