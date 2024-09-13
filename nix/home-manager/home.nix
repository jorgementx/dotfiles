{ config, pkgs, ... }:

# let
   # stablePkgs = import <nixpkgs-stable> {};
# in
{
  nixpkgs.config.allowunfree = true;
  nixpkgs.config.allowUnfreePredicate = _: true;

  home = rec {
    username = "jorge";
    homeDirectory = "/home/${username}";
    stateVersion = "24.05";
    packages = with.pkgs; [
      anki
      cava
      obsidian
      vscode
      google-chrome
      kubectl
      kubectl-node-shell
      kubernetes-helm
      pipx
      peco
      jq
    ];
    # Home Manager is pretty good at managing dotfiles. The primary way to manage
    # plain files is through 'home.file'.
    file = {};

    sessionVariables = {
      EDITOR = "vim";
    };

  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userName = "jorgementx";
    userEmail = "jordims2000@gmail.com";
    extraConfig = {
      pull.rebase = false;
    };
  };

  programs.mpv.enable = true;

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

  programs.btop = {
    enable = true;
    settings = {
      color_theme = "ayu";
      theme_background = false;
      vim_keys = true;
    };
  };

  programs.lazygit = {
    enable = true;
    settings = {
      promptToReturnFromSubprocess = false;
      gui.showIcons = true;
    };
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    # plugins = with pkgs.vimPlugins; [
    # ];
  };

  programs.k9s = {
    enable = true;
    plugin = {
      plugins = {
        nodeShell = {
          shortCut = "s";
          description = "Shell";
          scopes = [ "nodes" ];
          command = "bash";
          background = false;
          args = [
            "-c"
            "kubectl node-shell $NAME"
          ];
        };
      };
    };
    settings = {
      shellPod = {
        image = "busybox:1.35.0";
        namespace = "default";
        limits = {
          cpu = "100m";
          memory = "100Mi";
        };
      };
    };
    skins = {
      dracula = let
          foreground = "#f8f8f2";
          background = "#282a36";
          current_line = "#44475a";
          selection = "#44475a";
          comment = "#6272a4";
          cyan = "#8be9fd";
          green = "#50fa7b";
          orange = "#ffb86c";
          pink = "#ff79c6";
          purple = "#bd93f9";
          red = "#ff5555";
          yellow = "#f1fa8c";
      in {
        k9s = {
          body = {
            fgColor = foreground;
            bgColor = background;
            logoColor = purple;
          };
          prompt = {
            fgColor = foreground;
            bgColor = background;
            suggestColor = purple;
          };
          info = {
            fgColor = pink;
            sectionColor = foreground;
          };
          dialog = {
            fgColor = foreground;
            bgColor = background;
            buttonFgColor = foreground;
            buttonBgColor = purple;
            buttonFocusFgColor = yellow;
            buttonFocusBgColor = pink;
            labelFgColor = orange;
            fieldFgColor = foreground;
          };
          frame = {
            border = {
              fgColor = selection;
              focusColor = current_line;
            };
            menu = {
              fgColor = foreground;
              keyColor = pink;
              numKeyColor = pink;
            };
            crumbs = {
              fgColor = foreground;
              bgColor = current_line;
              activeColor = current_line;
            };
            status = {
              newColor = cyan;
              modifyColor = purple;
              addColor = green;
              errorColor = red;
              highlightColor = orange;
              killColor = comment;
              completedColor = comment;
            };
            title = {
              fgColor = foreground;
              bgColor = current_line;
              highlightColor = orange;
              counterColor = purple;
              filterColor = pink;
            };
          };
          views = {
            charts = {
              bgColor = "default";
              defaultDialColors = [purple red];
              defaultChartColors = [purple red];
            };
            table = {
              fgColor = foreground;
              bgColor = background;
              header = {
                fgColor = foreground;
                bgColor = background;
                sorterColor = cyan;
              };
            };
            xray = {
              fgColor = foreground;
              bgColor = background;
              cursorColor = current_line;
              graphicColor = purple;
              showIcons = false;
            };
            yaml = {
              keyColor = pink;
              colonColor = purple;
              valueColor = foreground;
            };
            logs = {
              fgColor = foreground;
              bgColor = background;
              indicator = {
                fgColor = foreground;
                bgColor = purple;
                toggleOnColor = green;
                toggleOffColor = cyan;
              };
            };
          };
        };
      };
    };
  };

  nix.gc = {
    automatic = true;
    options = "-d";
    frequency = "weekly";
  };
}
