local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

vim.cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]])

local ok, packer = pcall(require, "packer")
if not ok then
	return
end

packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

return packer.startup(function(use)
	-- Plugin Manager
	use({
		"wbthomason/packer.nvim",
		commit = "00ec5adef58c5ff9a07f11f45903b9dbbaa1b422",
	})

	-- Plugin Caching
	use({
		"lewis6991/impatient.nvim",
		commit = "969f2c5c90457612c09cf2a13fee1adaa986d350",
	})

	-- Commond dependency
	use({
		"nvim-lua/plenary.nvim",
		commit = "968a4b9afec0c633bc369662e78f8c5db0eba249",
	})

	-- Colorscheme
	use({
		"catppuccin/nvim",
		commit = "ffd6f3e10445cb2c92401b75d4eccb75faf8b6b1",
	})

	-- Status Line
	use({
		"nvim-lualine/lualine.nvim",
		commit = "3362b28f917acc37538b1047f187ff1b5645ecdd",
	})

	-- Nerd Icons
	use({
		"kyazdani42/nvim-web-devicons",
		commit = "8d2c5337f0a2d0a17de8e751876eeb192b32310e",
	})

	-- Highlight symbol under cursor
	use({
		"RRethy/vim-illuminate",
		commit = "c82e6d04f27a41d7fdcad9be0bce5bb59fcb78e5",
	})

	-- Dashboard
	use({
		"goolord/alpha-nvim",
		commit = "ef27a59e5b4d7b1c2fe1950da3fe5b1c5f3b4c94",
	})

	-- File Explorer
	use({
		"kyazdani42/nvim-tree.lua",
		commit = "bdb6d4a25410da35bbf7ce0dbdaa8d60432bc243",
	})

	-- Tree Parser & Syntax Highlighting
	use({
		"nvim-treesitter/nvim-treesitter",
		commit = "518e27589c0463af15463c9d675c65e464efc2fe",
	})

	-- Fuzzy Finder
	use({
		"nvim-telescope/telescope.nvim",
		commit = "d96eaa914aab6cfc4adccb34af421bdd496468b0",
	})

	-- Git Gutter
	use({
		"lewis6991/gitsigns.nvim",
		commit = "c18e016864c92ecf9775abea1baaa161c28082c3",
	})

	-- Git Client
	use({
		"tpope/vim-fugitive",
		commit = "96c1009fcf8ce60161cc938d149dd5a66d570756",
		cmd = { "Git" },
	})

	-- Comments
	use({
		"numToStr/Comment.nvim",
		commit = "2c26a00f32b190390b664e56e32fd5347613b9e2",
	})
	use({
		"JoosepAlviste/nvim-ts-context-commentstring",
		commit = "88343753dbe81c227a1c1fd2c8d764afb8d36269",
	})

	-- Snippets
	use({
		"L3MON4D3/LuaSnip",
		commit = "79b2019c68a2ff5ae4d732d50746c901dd45603a",
	})
	use({
		"rafamadriz/friendly-snippets",
		commit = "d27a83a363e61009278b6598703a763ce9c8e617",
	})

	-- Completion
	use({
		"hrsh7th/nvim-cmp",
		commit = "df6734aa018d6feb4d76ba6bda94b1aeac2b378a",
	})
	use({
		"hrsh7th/cmp-buffer",
		commit = "62fc67a2b0205136bc3e312664624ba2ab4a9323",
	})
	use({
		"hrsh7th/cmp-path",
		commit = "466b6b8270f7ba89abd59f402c73f63c7331ff6e",
	})
	use({
		"saadparwaiz1/cmp_luasnip",
		commit = "a9de941bcbda508d0a45d28ae366bb3f08db2e36",
	})
	use({
		"hrsh7th/cmp-nvim-lsp",
		commit = "affe808a5c56b71630f17aa7c38e15c59fd648a8",
	})
	use({
		"hrsh7th/cmp-nvim-lua",
		commit = "d276254e7198ab7d00f117e88e223b4bd8c02d21",
	})

	-- Language Server Protocol
	use({
		"neovim/nvim-lspconfig",
		commit = "148c99bd09b44cf3605151a06869f6b4d4c24455",
	})
	use({
		"williamboman/nvim-lsp-installer",
		commit = "e9f13d7acaa60aff91c58b923002228668c8c9e6",
	})
	use({
		"jose-elias-alvarez/null-ls.nvim",
		commit = "ff40739e5be6581899b43385997e39eecdbf9465",
		requires = {
			{
				"nvim-lua/plenary.nvim",
				commit = "968a4b9afec0c633bc369662e78f8c5db0eba249",
			},
		},
	})

	-- Debugger
	use({
		"mfussenegger/nvim-dap",
		commit = "014ebd53612cfd42ac8c131e6cec7c194572f21d",
	})
	use({
		"rcarriga/nvim-dap-ui",
		commit = "d76d6594374fb54abf2d94d6a320f3fd6e9bb2f7",
	})
	use({
		"ravenxrz/DAPInstall.nvim",
		commit = "8798b4c36d33723e7bba6ed6e2c202f84bb300de",
	})

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
