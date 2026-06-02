# Repository Guidelines

## Project Structure & Module Organization
This repository is a flake-based NVF Neovim configuration. `flake.nix` builds the default package and wires together the local modules.

- `config/` contains the main NVF option set, split by feature area such as `lsp.nix`, `theme.nix`, and `formatter.nix`.
- `modules/` contains reusable custom modules, currently focused on language-specific extensions under `modules/languages/`.
- `nvim/after/ftplugin/` contains filetype-local Lua runtime tweaks loaded by Neovim.
- `README.md` is minimal; contributors should keep workflow notes in this guide unless the public README also needs updating.

## Build, Test, and Development Commands
- `nix run .#default`: launch the configured Neovim package locally.
- `nix build .#default`: build the package without opening Neovim; use this before submitting changes.
- `nix flake check`: run flake validation if checks are added later; use it when touching `flake.nix` or inputs.

Run commands from the repository root. Example: `nix run .#default -- config/autocomplete.nix`.

## Coding Style & Naming Conventions
Follow the existing style in each language rather than reformatting unrelated files.

- Nix files use small, focused modules with lowercase filenames such as `statusline.nix` and `yaml.nix`.
- Lua ftplugins use 2-space indentation and concise local bindings, as in `nvim/after/ftplugin/lua.lua`.
- Prefer descriptive option names under the `vim.*` namespace and keep feature-specific logic in the nearest module.
- Formatting is editor-driven: the config enables `stylua`, `prettier`, `shfmt`, and related tools through Conform in `config/formatter.nix`.

## Testing Guidelines
There is no separate test suite in this repository today. Treat `nix build .#default` as the required validation step, and launch `nix run .#default` to smoke-test behavior in Neovim after changing runtime files or language modules.

## Commit & Pull Request Guidelines
Recent history is dominated by timestamped `Automatic update ...` commits. For manual changes, use short imperative subjects that describe one logical change, for example `Add YAML filetype overrides`.

Pull requests should include:
- a brief summary of user-visible editor behavior changes
- the validation performed (`nix build .#default`, manual Neovim smoke test)
- screenshots or terminal snippets only when UI behavior changed
