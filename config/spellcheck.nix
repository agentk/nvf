_: {
  vim.spellcheck = {
    enable = true;
    languages = ["en_au" "en_us"];
    # programmingWordlist.enable = true;
  };
  vim.options = {
    # Enable spell check highlighting by default
    # vim.opt.spell = true
    # Use Australian English as primary and US English as backup for spell checking
    # vim.opt.spelllang = { 'en_au', 'en_us' }

    # Disable spell checking for certain filetypes
    # vim.api.nvim_create_autocmd('FileType', {
    #   group = vim.api.nvim_create_augroup('disable-spell-check', { clear = true }),
    #   pattern = {
    #     'bash',
    #     'c',
    #     'cpp',
    #     'css',
    #     'dockerfile',
    #     'go',
    #     'html',
    #     'javascript',
    #     'json',
    #     'jsonc',
    #     'lua',
    #     'make',
    #     'scss',
    #     'sh',
    #     'sql',
    #     'typescript',
    #     'yaml',
    #     'yml',
    #   },
    #   callback = function() vim.opt_local.spell = false end,
    # })
  };
}
