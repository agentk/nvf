_: {
  vim.diagnostics.nvim-lint = {
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
}
