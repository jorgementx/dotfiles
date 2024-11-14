
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
      atuin
      inputs.nixvim.packages."${pkgs.system}".default
    ];
    file = {};
    sessionVariables = {
      VISUAL = "code";
      EDITOR = "nvim";
    };
  };

  imports = [
    ../modules/mpv.nix
    ../modules/k9s.nix
    ../modules/translate.nix
    ../modules/btop.nix
    ../modules/lazygit.nix
    ../modules/neovim.nix
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
