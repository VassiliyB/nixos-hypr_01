{ pkgs, ... }:

{
  programs.foot = {
    enable = true;
    server.enable = true;
    settings = {
      main = {
        term = "xterm-256color";
        font = "JetBrainsMono Nerd Font:size=11";
        dpi-aware = "yes";
        pad = "12x12";
      };

      mouse = {
        hide-when-typing = "yes";
      };

      colors = {
        alpha = 0.9;
	cursor = "1a1b26 c0caf5";
        background = "1a1b26"; # Tokyo Night стиль
        foreground = "c0caf5";
        regular0 = "15161e"; # black
        regular1 = "f7768e"; # red
        regular2 = "9ece6a"; # green
        regular3 = "e0af68"; # yellow
        regular4 = "7aa2f7"; # blue
        regular5 = "bb9af7"; # magenta
        regular6 = "7dcfff"; # cyan
        regular7 = "a9b1d6"; # white
      };

      cursor = {
        style = "beam";
        blink = "yes";
      };
    };
  };
}
