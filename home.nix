{ config, pkgs, ... }:

{

   imports = [
	./modules/hypr
   ];

   home.username = "master";
   home.homeDirectory ="/home/master";
   home.stateVersion = "25.11";

   programs.bash = {
        enable = true;
        shellAliases = {
	    btw = "echo i use hypland!";
	    nrs = "sudo nixos-rebuild switch --flake ~/nixos-dotfiles#nixos";
        };
	profileExtra = ''
	    if [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTRN" = 1 ]; then
	        exec uwsm start -S hyprland-uwsm.desktop
	    fi
	'';
   };    
}
