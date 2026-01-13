-- Для lazy.nvim (добавьте в plugins.lua или init.lua)
return {
  'potamides/translate.nvim',
  url = 'git@github.com:uga-rosa/translate.nvim.git',
  dependencies = {
    'nvim-telescope/telescope.nvim',
    'nvim-lua/plenary.nvim',
  },
  config = function()
    require('translate').setup {
      default = {
        --command = 'google', -- или "yandex", "bing", "deepl"
        default_cmd = 'deepl',
        api_key = os.getenv 'DEEPL_API_KEY',
        apiUrl = 'https://api-free.deepl.com',
        target_lang = 'ru',
        output = 'floating', -- "floating", "replace", "insert"
      },
      preset = {
        output = {
          floating = {
            border = 'rounded',
            max_width = 120,
            max_height = 20,
          },
        },
      },
      parse_after = {
        delay = 200,
      },
    }

    -- Ключевые отображения
    -- Перевод выделенного текста
    vim.keymap.set('v', '<Leader>t', ':Translate EN -output=floating<CR>')
    -- Перевод слова под курсором
    vim.keymap.set('n', '<Leader>t', ':Translate EN -output=floating<CR>')
    -- Перевод в текущий буфер
    vim.keymap.set('v', '<Leader>T', ':Translate EN -output=replace<CR>')
    -- Дополнительные удобные отображения
    vim.keymap.set('v', '<Leader>tr', ':Translate RU -output=floating<CR>') -- на русский
    vim.keymap.set('n', '<Leader>tr', ':Translate RU -output=floating<CR>') -- на русский
  end,
}
