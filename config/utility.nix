{lib, ...}: let
  inherit (lib.nvim.binds) mkKeymap;
  inherit (lib.generators) mkLuaInline;
in {
  vim = {
    utility = {
      # { -- Detect tabstop and shiftwidth automatically
      #   'tpope/vim-sleuth',
      #   init = function() vim.cmd([[ let g:sleuth_dts_heuristics = 0 ]]) end,
      # },
      # https://github.com/NotAShelf/nvf/blob/main/modules/plugins/utility/sleuth/config.nix
      sleuth.enable = true;

      preview.markdownPreview.enable = true;

      ccc.enable = false;
      diffview-nvim.enable = true;

      images = {
        image-nvim.enable = false;
      };

      snacks-nvim = {
        enable = true;
        setupOpts = {
          bigfile.enabled = true;
          indent = {
            enabled = true;
            indent.char = "┊";
            animate.enabled = false;
          };
          # notifier.enabled = true;
          statuscolumn.enabled = true;
          words.enabled = true;
        };
      };

      # keys = {
      #   { '<leader>gb', function() Snacks.picker.git_branches() end, desc = 'Git Branches' },
      #   { '<leader>gS', function() Snacks.picker.git_status() end, desc = 'Git Status' },
      #   { ']]', function() Snacks.words.jump(vim.v.count1) end, desc = 'Next Reference', mode = { 'n', 't' } },
      #   { '[[', function() Snacks.words.jump(-vim.v.count1) end, desc = 'Prev Reference', mode = { 'n', 't' } },
      # },
      # config = function(_, opts) require('snacks').setup(opts) end,
      # init = function()
      #   vim.api.nvim_create_autocmd('User', {
      #     pattern = 'VeryLazy',
      #     callback = function()
      #       -- Setup globals for debugging (lazy-loaded)
      #       -- _G.dd = function(...) Snacks.debug.inspect(...) end
      #       -- _G.bt = function() Snacks.debug.backtrace() end
      #       -- vim.print = _G.dd -- Override print to use snacks for `:=` command
      #
      #       -- Create toggle mappings
      #       Snacks.toggle.option('background', { off = 'light', on = 'dark', name = 'Dark Background' }):map('<leader>tb')
      #       Snacks.toggle.option('conceallevel', { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map('<leader>tc')
      #       Snacks.toggle.diagnostics():map('<leader>td')
      #       Snacks.toggle.dim():map('<leader>tD')
      #       Snacks.toggle.indent():map('<leader>tg')
      #       Snacks.toggle.inlay_hints():map('<leader>th')
      #       Snacks.toggle.line_number():map('<leader>tl')
      #       Snacks.toggle.option('relativenumber', { name = 'Relative Number' }):map('<leader>tL')
      #       Snacks.toggle.option('spell', { name = 'Spelling' }):map('<leader>ts')
      #       Snacks.toggle.treesitter():map('<leader>tT')
      #       Snacks.toggle.option('wrap', { name = 'Wrap' }):map('<leader>tw')
      #       Snacks.toggle.zen():map('<leader>tz')
      #       Snacks.toggle.zoom():map('<leader>tZ')
      #     end,
      #   })
      # end,

      oil-nvim = {
        enable = true;
        setupOpts = {
          view_options = {
            # Show files and directories that start with "."
            show_hidden = true;
            is_always_hidden =
              mkLuaInline
              #lua
              ''
                function(name, _)
                  if name:match('^.DS_Store$') then return true end
                  return false
                end
              '';
          };
        };
      };
      # return {
      #   {
      #     'stevearc/oil.nvim',
      #     lazy = false,
      #     dependencies = {
      #       { 'echasnovski/mini.icons', opts = {} },
      #     },
      #     keys = {
      #       { '-', '<cmd>Oil<cr>', desc = 'Oil' },
      #     },
      #     opts = {
      #       view_options = {
      #         -- Show files and directories that start with "."
      #         show_hidden = true,
      #         is_always_hidden = function(name, _)
      #           if name:match('^.DS_Store$') then return true end
      #           return false
      #         end,
      #       },
      #     },
      #   },
      # }
    };

    keymaps = [
      (mkKeymap ["n"] "<leader>mp" "<cmd>MarkdownPreviewToggle<cr>" {desc = "Markdown Preview";})
    ];
  };
}
