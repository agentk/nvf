{lib, ...}: let
  inherit (lib.generators) mkLuaInline;
in {
  vim = {
    formatter.conform-nvim = {
      enable = true;

      setupOpts = {
        notify_on_error = false;
        format_on_save =
          mkLuaInline
          # lua
          ''
            function(bufnr)
              local filetype = vim.bo[bufnr].filetype
              local bufname = vim.api.nvim_buf_get_name(bufnr)
              local disable_markdown = true
              if filetype == 'markdown' and vim.startswith(bufname, vim.fn.expand('~/notes/')) then disable_markdown = false end
              local disable_filetypes = { c = true, cpp = true, markdown = disable_markdown }
              local format = 'none'
              if disable_filetypes[filetype] then format = 'fallback' end
              return {
                timeout_ms = 2000,
                lsp_format = format,
              }
            end '';
        formatters_by_ft = {
          javascript = ["prettier"];
          json = ["prettier"];
          lua = ["stylua"];
          markdown = ["prettier" "markdownlint"];
          ruby = ["rubocop"];
          swift = ["swiftlint" "swiftformat"];
          typescript = ["prettier"];
          zsh = ["shellcheck" "shfmt"];
        };
      };
    };

    maps.normal."<leader>lF" = {
      action = ":lua require('conform').format({ async = true, lsp_format = 'fallback' })<CR>";
      desc = "Format [conform]";
    };
  };
}
