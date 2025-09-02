{lib, ...}: let
  inherit (lib.generators) mkLuaInline;
in {
  vim = {
    binds = {
      whichKey = {
        enable = true;
        setupOpts = {
          preset = "helix";
          spec =
            mkLuaInline
            # lua
            ''
              {
                -- Document existing key chains
                { '<leader>a', group = 'Avante' },
                { '<leader>l', group = 'Language' },
                { '<leader>t', group = 'Toggle' },
                -- { '<leader>c', group = 'Code' },
                -- { '<leader>d', group = 'Document' },
                -- { '<leader>f', group = 'Find' },
                -- { '<leader>g', group = 'Git' },
                -- { '<leader>h', group = 'Git Hunk', mode = { 'n', 'v' } },
                -- { '<leader>m', group = 'Markdown' },
                -- { '<leader>o', group = 'Obsidian' },
                -- { '<leader>r', group = 'Rename' },
                -- { '<leader>s', group = 'Search' },
                -- { '<leader>u', group = 'UI' },
                -- { '<leader>w', group = 'Workspace' },
                -- { '<leader>x', group = 'Trouble' },

                -- LSP builtins
                -- { 'K', desc = 'Display symbol documentation' },
                -- { 'gra', desc = 'Code action', icon = '󰁨' },
                -- { 'gri', desc = 'List implementations', icon = '' },
                -- { 'grn', desc = 'Rename all references', icon = '' },
                -- { 'gO', desc = 'List all document symbols', icon = '' },
                -- { '<C-s>', desc = 'Display signature help', mode = { 'i', 's' } },
              } '';
        };
      };

      cheatsheet.enable = true;
    };

    maps.normal."<leader>?" = {
      action = "<cmd>lua require('which-key').show({ global = false })<CR>";
      desc = "Buffer Local Keymaps [which-key]";
    };
  };
}
