local plugin = require("utils.plugin")
local keybinding = require("utils.keybinding")

-- TODO:
--  1. 不允许退出 cwd
--  2. 实时 git
--  3. 使用 vscode-icnos

plugin.register_plugin({
  "~/new/nvim-tree.lua",
  requires = "kyazdani42/nvim-web-devicons"
})

plugin.try_require_plugin(
  "nvim-tree",
  function(nvim_tree)
    keybinding.map("n", "<C-m>", ":NvimTreeToggle<CR>", keybinding.normal_opt)
    -- #TODO: insert 模式

    -- color
    require('onedark').setup {
      highlights = {
        NvimTreeGitNew = { fg = "$red" }, -- new file
        NvimTreeGitDirty = { fg = "$yellow" }, -- modified but not staged
        NvimTreeFileStaged = { fg = "$green" },

        NvimTreeSpecialFile = { fg = "#E0C7FF", fmt = "underline" },
        NvimTreeRootFolder = { fg = "$grey" },

        NvimTreeFolderName = { fg = "#abb2bf" },
        NvimTreeEmptyFolderName = { fg = "#abb2bf" },
        NvimTreeOpenedFolderName = { fg = "#abb2bf" },
      }
    }

    -- keybindings
    local list_keys = {
      -- 打开文件或文件夹
      { key = { "<CR>", "o", "<2-LeftMouse>" }, action = "edit" },
      -- 分屏打开文件
      { key = "v", action = "vsplit" },
      { key = "h", action = "split" },
      -- 显示隐藏文件
      { key = "i", action = "toggle_custom" }, -- 对应 filters 中的 custom (node_modules)
      { key = ".", action = "toggle_dotfiles" }, -- Hide (dotfiles)
      -- 文件操作
      { key = "<F5>", action = "refresh" },
      { key = "a", action = "create" },
      { key = "d", action = "trash" },
      { key = "r", action = "rename" },
      { key = "x", action = "cut" },
      { key = "c", action = "copy" },
      { key = "p", action = "paste" },
      -- { key = "s", action = "system_open" },
    }

    nvim_tree.setup({
      -- about netrw
      disable_netrw = true,
      hijack_netrw = true,
      -- open behaviour
      open_on_setup = true,
      open_on_setup_file = true,
      ignore_buffer_on_setup = false,
      ignore_ft_on_setup = {}, -- 'ft' means 'file types'
      open_on_tab = false,
      hijack_unnamed_buffer_when_opening = false,
      -- git integration
      git = {
        enable = true,
        ignore = false,
        show_on_dirs = true,
        timeout = 500,
      },
      -- file watcher
      filesystem_watchers = {
        enable = true,
        interval = 100,
        debounce_delay = 50,
      },
      -- about display
      view = {
        adaptive_size = true,
        hide_root_folder = false,
        width = "10%",
        side = "left",
        signcolumn = "yes",
        mappings = {
          custom_only = true,
          list = list_keys,
        }
      },
      renderer = {
        add_trailing = false,
        group_empty = false,
        full_name = false,
        highlight_git = true,
        highlight_opened_files = "none",
        special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md", "package.json", },
        symlink_destination = true,
        root_folder_modifier = ":t",
        indent_markers = {
          enable = false,
        },
        icons = {
          padding = " ",
          git_placement = "after",
          show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = true,
          },
          glyphs = {
            default = "",
            symlink = "",
            folder = {
              default = "",
              open = "",
              empty = "",
              empty_open = "",
              symlink = "",
              symlink_open = "",
              arrow_open = "",
              arrow_closed = "",
            },
            git = {
              unstaged = "",
              staged = "",
              unmerged = "",
              renamed = "➜",
              untracked = "",
              deleted = "",
              ignored = "◌",
            },
          },
        },
      },
      -- other
      auto_reload_on_write = true,
      hijack_cursor = true, -- 让光标在 filename 的第一个字母
      -- TODO:
      -- sync_root_with_cwd = true, -- https://stackoverflow.com/questions/2288756/how-to-set-working-current-directory-in-vim
      reload_on_bufenter = false, -- `BufEnter` 时不刷新
      respect_buf_cwd = false, -- 打开 tree 时不跟随 buffer 替换 cwd
      -- #TODO:
      update_focused_file = {
        enable = false,
      },
      system_open = {
        cmd = "open" -- for macos
      },
      diagnostics = {
        enable = true,
        show_on_dirs = true,
        icons = {
          hint = "ﯧ",
          info = "",
          warning = "",
          error = "",
        },
      },
      filters = {
        dotfiles = false,
        custom = { "^\\.git", "^\\.DS_Store" }
      },
      trash = {
        cmd = "trash",
        require_confirm = true,
      },
      -- TODO: custom sort
    })
  end
)

-- 自动关闭
-- vim.cmd([[
--  autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
-- ]])
