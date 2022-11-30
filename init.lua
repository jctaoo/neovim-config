function string.starts(String, Start)
  return string.sub(String, 1, string.len(Start)) == Start
end

for k in pairs(package.loaded) do
  -- print(k)
  if string.starts(k, "nvim-tree") then
    -- print(k)
    package.loaded[k] = nil
  end
end
require("modules.setup")
require("utils.plugin").commit_plugins()

require 'basic'
require 'keybindings'
-- require 'plugins'
-- require "colorscheme"
-- require "plugins.nvim-tree"
require "plugins.bufferline"
require "plugins.lualine"
require "plugins.telescope"
-- require "plugins.dashboard"
require "plugins.project"
require "plugins.nvim-treesitter"
require "plugins.indent-blankline"
-- require "plugins.autosave"

require("lsp.setup")
require("lsp.cmp")
require("lsp.ui")
require("lsp.null-ls")

-- vim.api.nvim_command("highlight NvimTreeFolderName guifg=#FA0D0D guibg=NONE guisp=NONE gui=NONE")
