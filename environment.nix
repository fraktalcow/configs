{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    ohMyZsh = {
      enable = true;
      plugins = [ "git" "sudo" "history" "copypath" "dirhistory" ];
      theme = "robbyrussell";
    };
    histSize = 10000;
  };

  programs.tmux.enable = true;
  
  xdg.mime.defaultApplications = {
    "text/plain" = "gnome-text-editor.desktop";
  };

  environment.variables.XCURSOR_THEME = "catppuccin-cursors";
}
