{lib, ...}: let
  inherit (lib.nvim.binds) pushDownDefault;
in {
  vim = {
    binds = {
      whichKey = {
        enable = true;
        setupOpts.preset = "helix";
        register = pushDownDefault {
          "<leader>t" = "Toggle";
          "<leader>m" = "Markdown";

          # Document builtins
          "gr" = "Replace";
          "K" = "Display symbol documentation";
          "gra" = "Code action";
          "gri" = "List implementations";
          "gO" = "List all document symbols";
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
