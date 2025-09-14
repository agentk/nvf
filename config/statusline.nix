{
  lualine-pretty-path-source,
  pkgs,
  ...
}: let
  lualine-pretty-path = pkgs.vimUtils.buildVimPlugin {
    name = "lualine-pretty-path";
    src = lualine-pretty-path-source;
    doCheck = false;
  };
in {
  vim = {
    extraPlugins.lualine-pretty-path.package = lualine-pretty-path;

    statusline = {
      lualine = {
        enable = true;
        theme = "auto";
        activeSection = {
          a = [
            ''"mode"''
          ];
          b = [
            ''"branch"''
          ];
          c = [
            ''{ "pretty_path", icon_show = false }''
            ''"diff"''
          ];
          y = [
            # "encoding", but only if it's not utf-8
            ''{ function() local ret, _ = (vim.bo.fenc or vim.go.enc):gsub('^utf%-8$', ""); return ret; end }''
            # "fileformat", but only if not unix
            ''{ function() local ret, _ = vim.bo.fileformat:gsub('^unix$', ""); return ret; end }''
            ''"filetype"''
            ''"filesize"''
          ];
          z = [
            ''{ 'searchcount', maxcount = 999, timeout = 120 }''
            ''{ 'progress', separator = ' ', padding = { left = 1, right = 0 } }''
            ''{ 'location', padding = { left = 0, right = 1 } }''
          ];
        };
      };
    };
  };
}
