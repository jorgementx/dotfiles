
{ config, pkgs, pkgs-stable, ... }@inputs:
{
  # nixpkgs.config.allowunfree = true;
  # nixpkgs.config.allowUnfreePredicate = _: true;

  home = let
    username = "jorge-pb";
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
      inputs.nixvim.packages."${pkgs.system}".default
    ];
    file = {};
    sessionVariables = {
      VISUAL = "code";
      EDITOR = "nvim";
      CAPACITOR_ANDROID_STUDIO_PATH = "/opt/android-studio/bin/studio.sh";
    };

    shellAliases = {
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
    ../modules/neovim.nix
    ../modules/atuin.nix
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;


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
