{ pkgs, ... }:

{
  programs.waybar = {
    enable = true;
  };

  # Этот блок отвечает за копирование файлов в ~/.config/waybar
  xdg.configFile."waybar/config".source = ./config.jsonc;
  xdg.configFile."waybar/style.css".source = ./style.css;
}
