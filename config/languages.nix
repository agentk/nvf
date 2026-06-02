{lib, ...}: let
  inherit (lib.nvim.binds) mkKeymap;
in {
  vim = {
    languages = {
      enableFormat = true;
      enableTreesitter = true;
      enableExtraDiagnostics = true;

      bash.enable = true;
      caddyfile.enable = true;
      css.enable = true;
      docker.enable = true;
      dts.enable = true;
      go.enable = true;
      html.enable = true;
      jq.enable = true;
      json.enable = true;
      lua = {
        enable = true;
        lsp.lazydev.enable = true;
      };
      make.enable = true;
      markdown = {
        enable = true;
        extensions.render-markdown-nvim = {
          enable = true;
          setupOpts = {
            completions.lsp.enabled = true;
            latex.enabled = false;
          };
        };
      };
      nix.enable = true;
      python.enable = true;
      rust.enable = true;
      sql.enable = true;
      toml.enable = true;
      tsx.enable = true;
      typescript.enable = true;
      xml.enable = true;
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
