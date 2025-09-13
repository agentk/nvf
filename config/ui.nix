{lib, ...}: let
  inherit (lib.nvim.binds) pushDownDefault;
in {
  vim = {
    ui = {
      borders.enable = true;
      noice = {
        enable = true;
        setupOpts = {
          cmdline.view = "cmdline";

          lsp.override = {
            "vim.lsp.util.convert_input_to_markdown_lines" = true;
            "vim.lsp.util.stylize_markdown" = true;
            "cmp.entry.get_documentation" = true;
          };

          messages.enabled = false;

          presets = {
            bottom_search = true; # use a classic bottom cmdline for search
            long_message_to_split = true; # long messages will be sent to a split
            inc_rename = true; # enables an input dialog for inc-rename.nvim
          };
        };
      };
      # colorizer.enable = true;
      # modes-nvim.enable = false; # the theme looks terrible with catppuccin
      # illuminate.enable = true;
      # breadcrumbs = {
      #   enable = true;
      #   navbuddy.enable = true;
      # };
      # smartcolumn = {
      #   enable = true;
      #   setupOpts.custom_colorcolumn = {
      #     # this is a freeform module, it's `buftype = int;` for configuring column position
      #     nix = "110";
      #     ruby = "120";
      #     java = "130";
      #     go = ["90" "130"];
      #   };
      # };
      # fastaction.enable = true;
    };

    maps = {
      command."<S-Enter>" = {
        action = "function() require('noice').redirect(vim.fn.getcmdline()) end";
        lua = true;
        desc = "Redirect Cmdline [noice]";
      };
      normal = {
        "<leader>ul" = {
          action = "function() require('noice').cmd('last') end";
          lua = true;
          desc = "Noice Last Message [noice]";
        };
        "<leader>uh" = {
          action = "function() require('noice').cmd('history') end";
          lua = true;
          desc = "Noice History [noice]";
        };
        "<leader>ua" = {
          action = "function() require('noice').cmd('all') end";
          lua = true;
          desc = "Noice All [noice]";
        };
        "<leader>ud" = {
          action = "function() require('noice').cmd('dismiss') end";
          lua = true;
          desc = "Dismiss All [noice]";
        };
        "<leader>ut" = {
          action = "function() require('noice').cmd('pick') end";
          lua = true;
          desc = "Noice Picker (Telescope/FzfLua) [noice]";
        };
      };
    };

    keymaps = [
      {
        key = "<c-f>";
        action = "function() if not require('noice.lsp').scroll(4) then return '<c-f>' end end";
        lua = true;
        silent = true;
        expr = true;
        desc = "Scroll Forward";
        mode = ["i" "n" "s"];
      }
      {
        key = "<c-b>";
        action = "function() if not require('noice.lsp').scroll(-4) then return '<c-b>' end end";
        lua = true;
        silent = true;
        expr = true;
        desc = "Scroll Backward";
        mode = ["i" "n" "s"];
      }
    ];

    binds.whichKey.register = pushDownDefault {"<leader>u" = "UI";};
  };
}
