{lib, ...}: let
  inherit (lib.nvim.binds) mkKeymap;
in {
  vim = {
    languages = {
      # TODO: Incorporate SchemaStore
      # {
      #   'b0o/SchemaStore.nvim',
      #   lazy = true,
      #   version = false, -- last release is way too old
      # },

      enableFormat = true;
      enableTreesitter = true;
      enableExtraDiagnostics = true;

      caddyfile.enable = true;
      dts.enable = true;
      nix.enable = true;
      markdown = {
        enable = true;
        extensions.render-markdown-nvim = {
          enable = true;
          setupOpts = {
            completions.lsp.enabled = true;
            file_types = ["markdown" "Avante"];
            latex.enabled = false;
          };
        };
      };
      bash.enable = true;
      clang.enable = true;
      lua = {
        enable = true;
        lsp.lazydev.enable = true;
      };
      yaml = {
        enable = true;
        extraFiletypes = [".yamllint"];
      };
    };

    # LazyDev autocompletion
    autocomplete.blink-cmp.setupOpts.sources = {
      default = ["lazydev"];
      providers.lazydev = {
        name = "LazyDev";
        module = "lazydev.integrations.blink";
        score_offset = 100; # make lazydev completions top priority (see `:h blink.cmp`)
      };
    };

    keymaps = [
      (mkKeymap ["n"] "<leader>mr" "<cmd>RenderMarkdown toggle<cr>" {desc = "Toggle Markdown Render";})
    ];
  };
}
