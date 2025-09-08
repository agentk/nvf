{lib, ...}: let
  inherit (lib.generators) mkLuaInline;
in {
  vim.autocomplete.blink-cmp = {
    enable = true;

    mappings = {
      close = null;
      complete = null;
      confirm = null;
      next = null;
      previous = null;
      scrollDocsDown = null;
      scrollDocsUp = null;
    };

    setupOpts = {
      cmdline = {
        completion.menu.auto_show = false;
        enabled = true;
        keymap.preset = "default";
      };

      completion = {
        documentation = {
          auto_show = true;
          window = {
            scrollbar = false;
            winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,EndOfBuffer:BlinkCmpDoc";
          };
        };

        ghost_text.enabled = true;

        list.selection = {
          auto_insert = true;
          preselect = false;
        };

        menu = {
          draw.columns =
            mkLuaInline
            # lua
            ''
              {
                { 'kind_icon' },
                { 'label', 'label_description', gap = 1 },
                { 'kind' },
                { 'source_name' },
              } '';
          scrollbar = false;
          scrolloff = 1;
        };
      };

      keymap.preset = "default";

      signature.enabled = true;

      sources.default = ["lsp" "path" "snippets" "buffer"];
    };
  };
}
