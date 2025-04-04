{ config, pkgs, ... }:
{
  nixpkgs.config.allowunfree = true;
  nixpkgs.config.allowUnfreePredicate = _: true;

  home = let
    username = "jorge";
  in {
    inherit username;
    homeDirectory = "/home/${username}";
    stateVersion = "24.05";
    packages = with pkgs; [
      kubectl
      kubectl-node-shell
      kubernetes-helm
      dive
      pipx
      peco
      jq
      jqp
      python311
      uv
      fzf
      go
    ];

    file = {};
    sessionVariables = {
      VISUAL = "code";
      EDITOR = "nvim";
    };
    shellAliases = {
      vim = "nvim";
      vi = "nvim";
      django = "python3 manage.py";
      whatismyip = "curl https://icanhazip.com";
      top = "btop";
      htop = "btop";
      lg = "lazygit";
      k = "kubectl";
      quote = "curl -s http://api.quotable.io/random | jq -r \'\"\\(.content)\\n- \\(.author)\"\'";
    };
  };

  imports = [
    ../modules/zsh.nix
    ../modules/mpv.nix
    ../modules/k9s.nix
    ../modules/translate.nix
    ../modules/btop.nix
    ../modules/lazygit.nix
    ../modules/atuin.nix 
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userName = "jorgementx";
    userEmail = "jordims2000@gmail.com";
    extraConfig = {
      pull.rebase = false;
      init.defaultBranch = "main";
      submodule.recurse = true;
    };
  };

  # programs.direnv = {
  #     enable = true;
  #     enableZshIntegration = true;
  #     nix-direnv.enable = true;
  # };

  nix.gc = {
    automatic = true;
    options = "-d";
    frequency = "weekly";
  };
}
