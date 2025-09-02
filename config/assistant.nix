{pkgs, ...}: {
  vim = {
    assistant.copilot = {
      enable = true;

      setupOpts = {
        suggestion.enabled = false;
        panel.enabled = false;
        filetypes = {
          markdown = true;
          help = false;
        };
      };
    };

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
