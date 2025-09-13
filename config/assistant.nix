{
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkForce;
in {
  vim = {
    assistant.copilot = {
      enable = true;

      setupOpts = {
        filetypes = {
          markdown = true;
          help = false;
        };
        mappings.panel.refresh = "";
        panel.enabled = false;
        suggestion.enabled = false;
      };
    };

    # Override the default keymaps as we are only using copilot to pass suggestions to blink
    lazy.plugins.copilot-lua.keys = mkForce [];

    autocomplete.blink-cmp.setupOpts.sources = {
      default = ["copilot"];
      providers.copilot = {
        name = "copilot";
        module = "blink-cmp-copilot";
        score_offset = 100;
        async = true;
      };
    };

    extraPlugins.blink-cmp-copilot.package = pkgs.vimPlugins.blink-cmp-copilot;
  };
}
