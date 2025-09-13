{lib, ...}: let
  inherit (lib.generators) mkLuaInline;
in {
  vim.diagnostics = {
    nvim-lint = {
      enable = true;

      linters_by_ft = {
        bash = ["bash"];
        dockerfile = ["hadolint"];
        javascript = ["eslint"];
        json = ["jsonlint"];
        nix = ["nix"];
        ruby = ["rubocop"];
        swift = ["swiftlint"];
        text = ["vale"];
        yaml = ["yamllint"];
        zsh = ["zsh"];
      };
    };

    config = {
      virtual_lines = true;
      virtual_text = true;
      underline = true;
      update_in_insert = false;
      severity_sort = true;
      float = {
        source = true;
      };
      signs = {
        text = mkLuaInline ''
          {
            [vim.diagnostic.severity.ERROR] = "󰅚 ",
            [vim.diagnostic.severity.WARN] = "󰀪 ",
            [vim.diagnostic.severity.INFO] = "󰋽 ",
            [vim.diagnostic.severity.HINT] = "󰌶 ",
          } '';
        numhl = mkLuaInline ''
          {
            [vim.diagnostic.severity.ERROR] = 'ErrorMsg',
            [vim.diagnostic.severity.WARN] = 'WarningMsg',
          } '';
      };
    };
  };
}
