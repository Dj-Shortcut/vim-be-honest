local M = {}

local defaults = {
  threshold = 5,
  message = "VimBeHonest: Arrow keys detected.
Vim has better motions.",
}

local state = {
  count = 0,
}

local arrows = { "<Up>", "<Down>", "<Left>", "<Right>" }
local modes = { "n", "i", "v" }
local initialized = false

local function keycode(key)
  return vim.api.nvim_replace_termcodes(key, true, false, true)
end

local function warn()
  vim.schedule(function()
    vim.notify(M.opts.message, vim.log.levels.WARN, { title = "VimBeHonest" })
  end)
end

function M.handle_arrow(key)
  state.count = state.count + 1

  if state.count == M.opts.threshold then
    warn()
  end

  return keycode(key)
end

function M.setup(opts)
  if initialized then
    return
  end

  M.opts = vim.tbl_deep_extend("force", defaults, opts or {})

  for _, mode in ipairs(modes) do
    for _, key in ipairs(arrows) do
      vim.keymap.set(mode, key, function()
        return M.handle_arrow(key)
      end, {
        desc = "VimBeHonest arrow key tracker",
        expr = true,
        silent = true,
      })
    end
  end

  initialized = true
end

return M
