{ config, pkgs, ...}: {
    programs.zsh = {
        enable = true;
        syntaxHighlighting.enable = true;
        autosuggestion.enable = true;

        oh-my-zsh = {
            enable = true;
            plugins = [
                "vi-mode"
                "zsh-interactive-cd"
                "sudo"
            ];
            theme = "agnoster";
        };
    };

    programs.zoxide.enable = true;
}
