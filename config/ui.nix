{lib, ...}: let
  inherit (lib.nvim.binds) pushDownDefault;
in {
  vim = {
    ui = {
      borders.enable = true;
      noice = {
        enable = false;
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
      colorizer.enable = true;
      fastaction.enable = true;
      illuminate.enable = true;

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
    };

    binds.whichKey.register = pushDownDefault {"<leader>u" = "UI";};
  };
}
