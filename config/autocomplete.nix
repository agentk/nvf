{lib, ...}: let
  inherit (lib.generators) mkLuaInline;
in {
  vim.autocomplete = {
    blink-cmp = {
      enable = true;

      mappings = {
        complete = null;
        confirm = null;
        next = null;
        previous = null;
        close = null;
        scrollDocsUp = null;
        scrollDocsDown = null;
      };

      setupOpts = {
        keymap.preset = "default";

        completion = {
          ghost_text.enabled = true;

          list.selection = {
            preselect = false;
            auto_insert = true;
          };

          menu = {
            scrolloff = 1;
            scrollbar = false;
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
          };

          documentation = {
            auto_show = true;
            window = {
              scrollbar = false;
              winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,EndOfBuffer:BlinkCmpDoc";
            };
          };
        };

        cmdline = {
          enabled = true;
          completion.menu.auto_show = false;
          keymap.preset = "default";
        };

        signature.enabled = true;
      };
    };
  };
}
