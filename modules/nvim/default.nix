{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };

  # Пробрасываем всю папку конфига целиком в ~/.config/nvim
  xdg.configFile."nvim".source = ./.;

  # Зависимости, без которых современные плагины Neovim не будут работать
  home.packages = with pkgs; [
    # Для Treesitter (компиляция парсеров)
    gcc
    gnumake
    nodejs
    
    # Для Telescope и поиска
    ripgrep
    fd
    
    # Для LSP и форматирования (которые мы обсуждали)
    stylua
    lua-language-server
    ruff
    python3
    mypy
  ];
}
