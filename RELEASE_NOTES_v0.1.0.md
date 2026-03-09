# VimBeHonest v0.1.0

Initial public release of VimBeHonest, a minimal Neovim plugin for calling out arrow key usage without blocking it.

## Highlights

- Tracks arrow key presses for `<Up>`, `<Down>`, `<Left>`, and `<Right>`.
- Works in normal, insert, and visual mode.
- Warns when total arrow key usage reaches 5 presses.
- Keeps the original arrow key behavior intact.
- Ships as a small Lua plugin with no extra dependencies.

## Scope of This Release

`v0.1.0` is intentionally small. It establishes the core behavior, repository documentation, and a basic smoke-test path for loading the plugin in headless Neovim.

## Manual Verification

Release smoke test:

```sh
nvim --headless -c "set rtp+=." -c "lua require('vimbehonest')" -c "qa"
```

Expected result: exit code `0` with no startup or Lua errors.
