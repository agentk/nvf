{
  lib,
  config,
  ...
}: let
  inherit (lib) mkIf;
  inherit (lib.options) mkEnableOption;
  inherit (lib.nvim.dag) entryAnywhere;

  cfg = config.vim.languages.dts;
in {
  options.vim.languages.dts.enable = mkEnableOption {
    description = "Enable DTS language support";
  };

  config = mkIf cfg.enable {
    vim.luaConfigRC.language-dts =
      entryAnywhere
      # lua
      ''
        vim.filetype.add({
          extension = {
            overlay = "dts",
          },
        }) '';
  };
}
