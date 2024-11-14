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
      anki
      obsidian
      vscode
      google-chrome
      kubectl
      kubectl-node-shell
      kubernetes-helm
      pipx
      peco
      jq
      jqp
    ];

    file = {};
    sessionVariables = {
      VISUAL = "code";
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

    programs.mpv = {
    enable = true;
    scriptOpts = {
      subs2srs = {
        autoclip="yes";
        deck_name="Korean deck::Sentence Mining";
        model_name="Refold Sentence Miner: Sentence";
        sentence_field="Example Sentence";
        secondary_field="Sentence Translation";
        audio_field="sentence_audio";
        image_field="image";
        snapshot_quality=80;
        vocab_field="Word";
        vocab_audio_field="word_audio";
      };
    };
  };

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


  xdg.desktopEntries = {
    mpv = {
      type = "Application";
      name = "mpv Media Player";
      mimeType = ["application/ogg" "application/x-ogg" "application/mxf" "application/sdp" "application/smil" "application/x-smil" "application/streamingmedia" "application/x-streamingmedia" "application/vnd.rn-realmedia" "application/vnd.rn-realmedia-vbr" "audio/aac" "audio/x-aac" "audio/vnd.dolby.heaac.1" "audio/vnd.dolby.heaac.2" "audio/aiff" "audio/x-aiff" "audio/m4" "aaudio/x-m4a" "application/x-extension-m4a" "audio/mp1" "audio/x-mp1" "audio/mp2" "audio/x-mp2" "audio/mp3" "audio/x-mp3" "audio/mpeg" "audio/mpeg2" "audio/mpeg3" "audio/mpegurl" "audio/x-mpegurl" "audio/mpg" "audio/x-mpg" "audio/rn-mpeg" "audio/musepack" "audio/x-musepack" "audio/ogg" "audio/scpls" "audio/x-scpls" "audio/vnd.rn-realaudio" "audio/wav" "audio/x-pn-wav" "audio/x-pn-windows-pcm" "audio/x-realaudio" "audio/x-pn-realaudio" "audio/x-ms-wma" "audio/x-pls" "audio/x-wav" "video/mpeg" "video/x-mpeg2" "video/x-mpeg3" "video/mp4v-es" "video/x-m4v" "video/mp4" "application/x-extension-mp4" "video/divx" "video/vnd.divx" "video/msvideo" "video/x-msvideo" "video/ogg" "video/quicktime" "video/vnd.rn-realvideo" "video/x-ms-afs" "video/x-ms-asf" "audio/x-ms-asf" "application/vnd.ms-asf" "video/x-ms-wmv" "video/x-ms-wmx" "video/x-ms-wvxvideo" "video/x-avi" "video/avi" "video/x-flic" "video/fli" "video/x-flc" "video/flv" "video/x-flv" "video/x-theora" "video/x-theora+ogg" "video/x-matroska" "video/mkv" "audio/x-matroska" "application/x-matroska" "video/webm" "audio/webm" "audio/vorbis" "audio/x-vorbis" "audio/x-vorbis+ogg" "video/x-ogm" "video/x-ogm+ogg" "application/x-ogm" "application/x-ogm-audio" "application/x-ogm-video" "application/x-shorten" "audio/x-shorten" "audio/x-ape" "audio/x-wavpack" "audio/x-tta" "audio/AMR" "audio/ac3" "audio/eac3" "audio/amr-wb" "video/mp2t" "audio/flac" "audio/mp4" "application/x-mpegurl" "video/vnd.mpegurl" "application/vnd.apple.mpegurl" "audio/x-pn-au" "video/3gp" "video/3gpp" "video/3gpp2" "audio/3gpp" "audio/3gpp2" "video/dv" "audio/dv" "audio/opus" "audio/vnd.dts" "audio/vnd.dts.hd" "audio/x-adpcm" "application/x-cue" "audio/m3u" "audio/vnd.wave" "video/vnd.avi"];
      terminal = false;
      categories = ["AudioVideo" "Audio" "Video" "Player" "TV"];
      exec = "mpv --player-operation-mode=pseudo-gui -- %U";
    };
  };


  nix.gc = {
    automatic = true;
    options = "-d";
    frequency = "weekly";
  };
}