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
          daily_notes = {
            date_format = "%Y-%m-%d";
            default_tags = ["Daily"];
            folder = "06 - Daily";
            template = "99 - Meta/00 - Templates/(TEMPLATE) Daily.md";
          };
          ui = {enable = false;};
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
      (mkKeymap "n" "<leader>on" "<cmd>ObsidianNew<cr>" {desc = "Obsidian New";})
      (mkKeymap "n" "<leader>oq" "<cmd>ObsidianQuickSwitch<cr>" {desc = "Obsidian Quick Switch";})
      (mkKeymap "n" "<leader>of" "<cmd>ObsidianFollowLink<cr>" {desc = "Obsidian FollowLink";})
      (mkKeymap "n" "<leader>ob" "<cmd>ObsidianBacklinks<cr>" {desc = "Obsidian Backlinks";})
      (mkKeymap "n" "<leader>ot" "<cmd>ObsidianToday<cr>" {desc = "Obsidian Today";})
      (mkKeymap "n" "<leader>oy" "<cmd>ObsidianYesterday<cr>" {desc = "Obsidian Yesterday";})
      (mkKeymap "n" "<leader>oo" "<cmd>ObsidianOpen<cr>" {desc = "Obsidian Open";})
      # Search and links
      (mkKeymap "n" "<leader>os" "<cmd>ObsidianSearch<cr>" {desc = "Obsidian Search";})
      (mkKeymap "n" "<leader>ol" "<cmd>ObsidianLinks<cr>" {desc = "Obsidian Links";})
      (mkKeymap "v" "<leader>ol" "<cmd>ObsidianLinkNew<cr>" {desc = "Obsidian LinkNew";})
      # Templates and utilities
      (mkKeymap "n" "<leader>ot" "<cmd>ObsidianTemplate<cr>" {desc = "Obsidian Template";})
      (mkKeymap "n" "<leader>or" "<cmd>ObsidianRename<cr>" {desc = "Obsidian Rename";})
      (mkKeymap "n" "<leader>op" "<cmd>ObsidianPasteImg<cr>" {desc = "Obsidian PasteImg";})
      (mkKeymap "n" "<leader>ox" "<cmd>ObsidianExtractNote<cr>" {desc = "Obsidian ExtractNote";})
      (mkKeymap "v" "<leader>ox" "<cmd>ObsidianExtractNote<cr>" {desc = "Obsidian ExtractNote";})
      # Workspace
      (mkKeymap "n" "<leader>ow" "<cmd>ObsidianWorkspace<cr>" {desc = "Obsidian Workspace";})
    ];
  };
}
