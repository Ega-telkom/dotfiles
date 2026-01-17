-- lua/plugins.lua

local deps = require("mini.deps")
deps.setup({
	 path = { package = vim.fn.stdpath("data") .. "/site" },
})

local add = deps.add

-- UI
add({ source = "Mofiqul/adwaita.nvim" })
add({ source = "lewis6991/gitsigns.nvim" })
add({ source = "arnamak/stay-centered.nvim" })

-- Snippets
add({ source = "rafamadriz/friendly-snippets" })

-- LSP
add({ source = "mason-org/mason-lspconfig.nvim" })
add({ source = "mason-org/mason.nvim" })
add({
	 source = "neovim/nvim-lspconfig",
	 depends = { "mason-org/mason.nvim" },
})
add({ source = "folke/lazydev.nvim" })

-- mini.nvim modules
local mini = {
	 "mini.fuzzy",
	 "mini.completion",
	 "mini.comment",
	 "mini.pairs",
	 "mini-git",
	 "mini.statusline",
	 "mini.indentscope",
	 "mini.files",
	 "mini.icons",
	 "mini.trailspace",
	 "mini.hipatterns",
	 "mini.cursorword",
	 "mini.starter",
	 "mini.diff",
	 "mini.tabline",
	 "mini.snippets",
	 "mini.pick",
}

for _, m in ipairs(mini) do
	 add({ source = "nvim-mini/" .. m, checkout = "stable" })
end
