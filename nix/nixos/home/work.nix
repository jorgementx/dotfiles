
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
      kubie
      velero
      docker-client
      dive
      pipx
      peco
      jq
      jqp
      uv
      glab
      commitizen
      oha
      k3d
      fzf
      devenv
      sops
      age
    ];
    file = {};
    sessionVariables = {
      #VISUAL = "code";
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
      konfig = "kubie ctx";
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

  programs.git = {
    enable = true;
    settings = {
      user.name = "Jorge Mentxaka";
      user.email = "jmentxaka@purpleblob.net";
      pull.rebase = false;
      pull.merge = true;
      push.useForceIfIncludes = true;
      init.defaultBranch = "main";
      submodule.recurse = true;
      core.autocrlf = "input";
      core.editor = "vim";
    };
  };

  programs.go.enable = true;

  programs.direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
  };

  programs.vicinae = {
      enable = true;
      systemd.autoStart = true;
      systemd.enable = true;
  };

  nix.gc = {
    automatic = true;
    options = "-d";
    dates = "weekly";
  };
}
