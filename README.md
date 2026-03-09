![Lua](https://img.shields.io/badge/Lua-2C2D72?style=for-the-badge&logo=lua&logoColor=white)
![Neovim](https://img.shields.io/badge/Neovim-57A143?style=for-the-badge&logo=neovim&logoColor=white)
![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)
# VimBeHonest

VimBeHonest is a small Neovim plugin that tracks arrow key usage and shows a warning when the count reaches 5. It is intentionally narrow: a lightweight reminder to use `hjkl` without changing how the arrow keys behave.

## Current Scope

- Tracks `<Up>`, `<Down>`, `<Left>`, and `<Right>`.
- Applies in normal, insert, and visual mode.
- Increments one in-memory counter across the session.
- Shows a warning once when the counter reaches the threshold.
- Preserves the original arrow key behavior.

## Non-Goals

- No additional detectors beyond arrow keys.
- No new dependencies or external services.
- No persistent stats, analytics, or history.
- No habit-training workflow, scoring, or escalation system.
- No expanded configuration surface for `v0.1.0`.

## Install

With `lazy.nvim`:

```lua
{
  "Dj-Shortcut/vim-be-honest",
}
```

The plugin auto-loads through `plugin/vimbehonest.lua`.

## Manual Smoke Test

From the repository root, run:

```sh
nvim --headless -c "set rtp+=." -c "lua require('vimbehonest')" -c "qa"
```

Expected result:

- Neovim exits cleanly.
- No Lua error or startup error is printed.

## Current Behavior

The plugin defines expression mappings for the four arrow keys in normal, insert, and visual mode. Each press increments a single session counter. When the counter reaches 5, VimBeHonest sends a warning through `vim.notify(...)` and continues returning the original key so native movement still works.

## License

MIT. See `LICENSE`.
