{lib, ...}: let
  inherit (lib.nvim.binds) pushDownDefault;
in {
  vim = {
    binds = {
      whichKey = {
        enable = true;
        setupOpts.preset = "helix";
        register = pushDownDefault {"<leader>t" = "Toggle";};
      };

      cheatsheet.enable = true;
    };

    maps.normal."<leader>?" = {
      action = "<cmd>lua require('which-key').show({ global = false })<CR>";
      desc = "Buffer Local Keymaps [which-key]";
    };
  };
}
# -- { '<leader>c', group = 'Code' },
# -- { '<leader>f', group = 'Find' },
# -- { '<leader>g', group = 'Git' },
# -- { '<leader>h', group = 'Git Hunk', mode = { 'n', 'v' } },
# -- { '<leader>m', group = 'Markdown' },
# -- { '<leader>o', group = 'Obsidian' },
# -- { '<leader>r', group = 'Rename' },
# -- { '<leader>s', group = 'Search' },
# -- { '<leader>w', group = 'Workspace' },
#
# -- LSP builtins
# -- { 'K', desc = 'Display symbol documentation' },
# -- { 'gra', desc = 'Code action', icon = '󰁨' },
# -- { 'gri', desc = 'List implementations', icon = '' },
# -- { 'grn', desc = 'Rename all references', icon = '' },
# -- { 'gO', desc = 'List all document symbols', icon = '' },
# -- { '<C-s>', desc = 'Display signature help', mode = { 'i', 's' } },

