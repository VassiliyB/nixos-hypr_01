{ config, pkgs, ... }:

{

   imports = [
	./modules/hypr
	./modules/waybar
	./modules/alacritty
   ];

   home.username = "master";
   home.homeDirectory ="/home/master";
   home.stateVersion = "25.11";


   programs.bash = {
        enable = true;
	shellAliases = {
	    	# Алиас теперь указывает на текущую папку с конфигом
	    	nrs = "sudo nixos-rebuild switch --flake ~/nixos-dotfiles#nixos";
	    	# Добавим алиас для чистки системы (удаляет старые поколения)
	    	nix-clean = "sudo nix-collect-garbage -d";
		yz = "yazi";
		vim = "nvim";
	};

	initExtra = ''
	    export PS1='\[\e[38;5;76m\]\u\[\e[0m\] in \[\e[38;5;75m\]\w\[\e[0m\] \\$ '
	'';
	
    };
}
