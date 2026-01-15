{ config, pkgs, ... }:

{

   imports = [
	./modules/hypr
	./modules/waybar
	./modules/alacritty
	./modules/foot
	./modules/nvim
	./modules/yazi
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
   
   programs.zoxide = {
       enable = true;
       enableZshIntegration = true;   # Если используете zsh
       enableBashIntegration = true; # Если используете bash
       enableFishIntegration = true; # Если используете fish
   };

   services.flameshot = {
      enable = true;
      package = pkgs.flameshot; # Можно использовать pkgs.flameshot.override { ... } если нужны спец. патчи
      settings = {
          General = {
          # Важнейшие настройки для Wayland
              useGrimAdapter = true;
              disabledGrimWarning = true;
              showStartupLaunchMessage = false;
          };
      };
   };

    home.packages = [ pkgs.grim ]; # Flameshot будет вызывать grim для захвата

     # 1. Глобальная настройка указателя
   home.pointerCursor = {
       gtk.enable = true;
       x11.enable = true;
       package = pkgs.bibata-cursors;
       name = "Bibata-Modern-Classic";
       size = 24;
   }; 

   gtk = {
       enable = true;
       theme = {
           package = pkgs.adw-gtk3;
           name = "adw-gtk3";
       };
       cursorTheme = {
           package = pkgs.bibata-cursors;
           name = "Bibata-Modern-Classic";
       };
   };

   wayland.windowManager.hyprland.settings = {
      env = [
        "XCURSOR_SIZE,24"
        "HYPRCURSOR_SIZE,24"
        "XCURSOR_THEME,Bibata-Modern-Classic"
      ];
      
      # Команда для принудительной установки курсора при старте
      exec-once = [
        "hyprctl setcursor Bibata-Modern-Classic 24"
      ];
    };
}
