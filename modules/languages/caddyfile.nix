{
  lib,
  config,
  pkgs,
  ...
}: let
  inherit (lib) mkIf;
  inherit (lib.options) mkEnableOption;

  cfg = config.vim.languages.caddyfile;
in {
  options.vim.languages.caddyfile.enable = mkEnableOption {
    description = "Enable caddyfile language support";
  };

  config = mkIf cfg.enable {
    vim.lazy.plugins.vim-caddyfile.package = pkgs.vimPlugins.vim-caddyfile;
  };
}
