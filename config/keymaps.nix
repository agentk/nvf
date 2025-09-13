{lib, ...}: let
  inherit (lib.nvim.binds) mkKeymap;
  inherit (lib.generators) mkLuaInline;
in {
  vim = {
    keymaps = [
      # Move up an down through wrapped lines
      (mkKeymap ["n" "x"] "j" "v:count == 0 ? 'gj' : 'j'" {
        silent = true;
        expr = true;
        desc = "Down";
      })
      (mkKeymap ["n" "x"] "<Down>" "v:count == 0 ? 'gj' : 'j'" {
        silent = true;
        expr = true;
        desc = "Down";
      })
      (mkKeymap ["n" "x"] "k" "v:count == 0 ? 'gk' : 'k'" {
        silent = true;
        expr = true;
        desc = "Up";
      })
      (mkKeymap ["n" "x"] "<Up>" "v:count == 0 ? 'gk' : 'k'" {
        silent = true;
        expr = true;
        desc = "Up";
      })

      # Set highlight on search, but clear on pressing <Esc> in normal mode
      (mkKeymap "n" "<Esc>" "<cmd>nohlsearch<CR>" {desc = "Esc";})

      # Keybinds to make split navigation easier.
      # Use CTRL+<hjkl> to switch between windows
      (mkKeymap "n" "<C-h>" "<C-w><C-h>" {desc = "Move focus to the left window";})
      (mkKeymap "n" "<C-l>" "<C-w><C-l>" {desc = "Move focus to the right window";})
      (mkKeymap "n" "<C-j>" "<C-w><C-j>" {desc = "Move focus to the lower window";})
      (mkKeymap "n" "<C-k>" "<C-w><C-k>" {desc = "Move focus to the upper window";})

      # Move Lines
      (mkKeymap "n" "<A-j>" "<cmd>m .+1<cr>==" {desc = "Move Down";})
      (mkKeymap "n" "<A-k>" "<cmd>m .-2<cr>==" {desc = "Move Up";})
      (mkKeymap "i" "<A-j>" "<esc><cmd>m .+1<cr>==gi" {desc = "Move Down";})
      (mkKeymap "i" "<A-k>" "<esc><cmd>m .-2<cr>==gi" {desc = "Move Up";})
      (mkKeymap "v" "<A-j>" ":m '>+1<cr>gv=gv" {desc = "Move Down";})
      (mkKeymap "v" "<A-k>" ":m '<-2<cr>gv=gv" {desc = "Move Up";})

      # Better indenting
      (mkKeymap "v" "<" "<gv" {desc = "Deindent";})
      (mkKeymap "v" ">" ">gv" {desc = "Indent";})

      # https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
      (mkKeymap "n" "n" "'Nn'[v:searchforward].'zv'" {
        expr = true;
        desc = "Next Search Result";
      })
      (mkKeymap "x" "n" "'Nn'[v:searchforward]" {
        expr = true;
        desc = "Next Search Result";
      })
      (mkKeymap "o" "n" "'Nn'[v:searchforward]" {
        expr = true;
        desc = "Next Search Result";
      })
      (mkKeymap "n" "N" "'nN'[v:searchforward].'zv'" {
        expr = true;
        desc = "Prev Search Result";
      })
      (mkKeymap "x" "N" "'nN'[v:searchforward]" {
        expr = true;
        desc = "Prev Search Result";
      })
      (mkKeymap "o" "N" "'nN'[v:searchforward]" {
        expr = true;
        desc = "Prev Search Result";
      })

      # Yank to the system clipboard with Y
      (mkKeymap ["n" "x"] "Y" "\"+y" {desc = "Yank to system clipboard";})

      # Delete without yanking with <leader>d
      (mkKeymap ["n" "v"] "<leader>d" "\"_d" {desc = "Delete without yanking";})
      (mkKeymap ["n" "v"] "<leader>D" "\"_D" {desc = "Delete without yanking";})
    ];

    # Highlight when yanking (copying) text
    augroups = [{name = "HighlightYank";}];
    autocmds = [
      {
        event = ["TextYankPost"];
        group = "HighlightYank";
        desc = "Highlight when yanking text";
        callback = mkLuaInline ''
          function()
            vim.highlight.on_yank()
          end '';
      }
    ];
  };
}
