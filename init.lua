local config = "eceprog"

-- plugin setup
require(config .. ".packer")

-- core setup files
require(config .. ".core.options")
require(config .. ".core.keymaps")
require(config .. ".core.colorscheme")

-- plugins
require(config .. ".plugins.comment")
require(config .. ".plugins.nvim-tree")
require(config .. ".plugins.lualine")
require(config .. ".plugins.telescope")
require(config .. ".plugins.treesitter")
