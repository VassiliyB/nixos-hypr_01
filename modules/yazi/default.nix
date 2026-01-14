{ pkgs, ... }:

{
  programs.yazi = {
    enable = true;
    enableZshIntegration = true; # Интеграция с Zsh (автоматический переход в папку при выходе)
    enableBashIntegration = true;

    # Настройки yazi.toml можно писать прямо здесь (в формате Nix)
    settings = {
      manager = {
        show_hidden = false;
        sort_by = "natural";
        sort_sensitive = false;
        sort_reverse = false;
        display_entry_size = true;
      };
    };
  };

  # Если у вас в папке ~/nixos-dotfiles/modules/yazi/ лежит файл theme.toml,
  # эта строка заставит Nix скопировать его в ~/.config/yazi/theme.toml
  xdg.configFile."yazi/theme.toml".source = ./theme.toml;

  # Аналогично для горячих клавиш, если создадите файл keymap.toml
  # xdg.configFile."yazi/keymap.toml".source = ./keymap.toml;
}
