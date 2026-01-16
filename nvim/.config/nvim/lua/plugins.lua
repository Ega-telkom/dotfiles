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

-- Terminal
add({ source = "rebelot/terminal.nvim" })

-- LSP
add({ source = "williamboman/mason.nvim" })
add({
	 source = "neovim/nvim-lspconfig",
	 depends = { "williamboman/mason.nvim" },
})

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
}

for _, m in ipairs(mini) do
	 add({ source = "nvim-mini/" .. m, checkout = "stable" })
end
