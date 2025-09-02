{
  lib,
  config,
  ...
}: let
  inherit (lib) mkIf concatMapStringsSep;
  inherit (lib.options) mkOption;
  inherit (lib.types) listOf str;
  inherit (lib.nvim.dag) entryAnywhere;

  cfg = config.vim.languages.yaml;
in {
  options.vim.languages.yaml.extraFiletypes = mkOption {
    type = listOf str;
    default = [];
    description = "Extra filetypes to format with the Markdown formatter";
  };

  config = mkIf (cfg.extraFiletypes != []) {
    vim.luaConfigRC.language-yaml-extraFileTypes =
      entryAnywhere
      # lua
      ''
        vim.filetype.add({
          filename = {
        ${concatMapStringsSep "\n" (f: "    ['${f}'] = 'yaml',") cfg.extraFiletypes}
          },
        }) '';
  };
}
