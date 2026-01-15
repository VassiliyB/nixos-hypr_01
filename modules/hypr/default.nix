{ config, pkgs, ... }:

{
    xdg.configFile."hypr/hyprland.conf".source = ./hyprland.conf;
    xdg.configFile."hypr/hyprpaper.conf".source = ./hyprpaper.conf;
}
