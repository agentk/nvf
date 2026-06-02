{lib, ...}: let
  inherit (lib.nvim.binds) mkKeymap;
in {
  vim = {
    notes = {
      todo-comments = {
        enable = true;
        setupOpts.signs = false;
      };

      obsidian = {
        enable = true;
        setupOpts = {
          ui = {enable = false;};
          legacy_commands = false;
          workspaces = [
            {
              name = "notes";
              path = "~/notes";
            }
          ];
        };
      };
    };

    keymaps = [
      # Note creation and navigation
      (mkKeymap "n" "<leader>on" "<cmd>Obsidian new<cr>" {desc = "Obsidian New";})
      (mkKeymap "n" "<leader>oq" "<cmd>Obsidian quick_switch<cr>" {desc = "Obsidian Quick Switch";})
      (mkKeymap "n" "<leader>of" "<cmd>Obsidian follow_link<cr>" {desc = "Obsidian FollowLink";})
      (mkKeymap "n" "<leader>ob" "<cmd>Obsidian backlinks<cr>" {desc = "Obsidian Backlinks";})
      (mkKeymap "n" "<leader>ot" "<cmd>Obsidian today<cr>" {desc = "Obsidian Today";})
      (mkKeymap "n" "<leader>oy" "<cmd>Obsidian yesterday<cr>" {desc = "Obsidian Yesterday";})
      (mkKeymap "n" "<leader>oo" "<cmd>Obsidian open<cr>" {desc = "Obsidian Open";})
      # Search and links
      (mkKeymap "n" "<leader>os" "<cmd>Obsidian search<cr>" {desc = "Obsidian Search";})
      (mkKeymap "n" "<leader>ol" "<cmd>Obsidian links<cr>" {desc = "Obsidian Links";})
      (mkKeymap "v" "<leader>ol" "<cmd>Obsidian link_new<cr>" {desc = "Obsidian LinkNew";})
      # Templates and utilities
      (mkKeymap "n" "<leader>ot" "<cmd>Obsidian template<cr>" {desc = "Obsidian Template";})
      (mkKeymap "n" "<leader>or" "<cmd>Obsidian rename<cr>" {desc = "Obsidian Rename";})
      (mkKeymap "n" "<leader>op" "<cmd>Obsidian paste_img<cr>" {desc = "Obsidian PasteImg";})
      (mkKeymap "n" "<leader>ox" "<cmd>Obsidian extract_note<cr>" {desc = "Obsidian ExtractNote";})
      (mkKeymap "v" "<leader>ox" "<cmd>Obsidian extract_note<cr>" {desc = "Obsidian ExtractNote";})
      # Workspace
      (mkKeymap "n" "<leader>ow" "<cmd>Obsidian workspace<cr>" {desc = "Obsidian Workspace";})
    ];
  };
}
