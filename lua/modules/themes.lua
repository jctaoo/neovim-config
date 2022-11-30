local plugin = require("utils.plugin")

plugin.register_plugin({"navarasu/onedark.nvim"})

local colorscheme = "onedark"

-- change color scheme
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " 没有找到！")
  return
end

-- open_on_tab = false,
-- update_cwd = true,
-- disable_netrw = true,
-- hijack_netrw = true,
-- hijack_unnamed_buffer_when_opening = false,
-- diagnostics = {
--   enable = true,
--   icons = {
--     hint = "",
--     info = "",
--     warning = "",
--     error = "",
--   },
-- },
-- git = {
--   enable = true,
--   ignore = false,
--   timeout = 500,
-- },
-- filters = {
--   custom = {
--     ".git",
--     -- "node_modules",
--     -- ".cache",
--     -- "__pycache__",
--   },
-- },
-- renderer = {
--   highlight_git = true,
--   add_trailing = false,
--   highlight_opened_files = "none",
--   indent_markers = {
--     enable = true,
--   },
-- },
-- view = {
--   width = 20, -- Finding 15% of windows width.
--   side = "left",
--   -- preserve_window_proportions = false,
--   mappings = {
--     list = {
--       { key = "<S-h>", cb = ":call ResizeLeft(3)<CR>" },
--       -- { key = "<C-h>", cb = tree_cb("toggle_dotfiles") },
--     },
--   },
-- },
-- actions = {
--   use_system_clipboard = true,
--   change_dir = {
--     enable = true,
--     global = false,
--     restrict_above_cwd = false,
--   },
--   open_file = {
--     quit_on_open = false,
--     resize_window = false,
--     window_picker = {
--       enable = true,
--       chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
--       exclude = {
--         filetype = {
--           "notify",
--           "packer",
--           "qf",
--           "diff",
--           "fugitive",
--           "fugitiveblame",
--           "Outline",
--           "toggleterm",
--           "alpha",
--         },
--         buftype = { "nofile", "terminal", "help" },
--       },
--     },
--   },
-- },