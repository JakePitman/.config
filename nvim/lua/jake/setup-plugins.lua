-- Install Packer if not installed
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end
-- True if Packer installed
local packer_bootstrap = ensure_packer()

-- Reloads neovim whenever this file is saved
-- Install missing plugins, updates old ones, remove unused ones
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost setup-plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Try to import packer. Return if unsuccessful
local status, packer = pcall(require, "packer")
if not status then
	return
end

return packer.startup(function(use)
	use("wbthomason/packer.nvim")

	use("nvim-lua/plenary.nvim") -- lua functions that many plugins use
	use("shaunsingh/moonlight.nvim") -- colorscheme
	vim.g.moonlight_italic_comments = true
	vim.g.moonlight_disable_background = true
	vim.g.moonlight_contrast = false
	vim.g.moonlight_borders = true
	vim.g.NERDSpaceDelims = 1 -- Add space after comment delimiter
	use("christoomey/vim-tmux-navigator") -- tmux & split window navigation
	use("szw/vim-maximizer") -- maximizes and restores current window
	use("tpope/vim-surround") -- add, delete, change surroundings
	use("inkarkat/vim-ReplaceWithRegister") -- replace with register contents using motion (gr + motion)
	use("preservim/nerdcommenter") -- commenting with gc
	use("nvim-tree/nvim-tree.lua") -- file explorer
	use("nvim-tree/nvim-web-devicons") -- vs-code like icons
	use("nvim-lualine/lualine.nvim") -- statusline
	use("tpope/vim-fugitive") -- git wrapper
	use("github/copilot.vim") -- GH Copilot
	vim.g.copilot_no_tab_map = true
	vim.g.copilot_assume_mapped = true

	-- Fuzzy finding
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for telescope - better sorting performance
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" }) -- fuzzy finder

	--Autocomplete
	use("hrsh7th/nvim-cmp") -- completion plugin
	use("hrsh7th/cmp-path") -- source for file system paths
	use("hrsh7th/cmp-buffer") -- source for text in buffer
	use("hrsh7th/cmp-cmdline") -- source for text in buffer

	-- Snippets
	use("saadparwaiz1/cmp_luasnip") -- for snippet autocompletion
	use("L3MON4D3/LuaSnip") -- snippet engine
	use("rafamadriz/friendly-snippets") -- useful snippets

	-- LSP
	use("williamboman/mason.nvim") -- in charge of managing lsp servers, linters & formatters
	use("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig

	-- configuring lsp servers
	use("neovim/nvim-lspconfig") -- easily configure language servers
	use("hrsh7th/cmp-nvim-lsp") -- for autocompletion
	use({
		"nvimdev/lspsaga.nvim",
		after = "nvim-lspconfig",
		config = function()
			require("lspsaga").setup({
				-- keybinds for navigation in lspsaga window
				scroll_preview = { scroll_down = "<C-f>", scroll_up = "<C-b>" },
				-- use enter to open file with definition preview
				definition = {
					-- edit = "<CR>",
					edit = "<C-CR>",
				},
				ui = {
					colors = {
						normal_bg = "#022746",
					},
				},
			})
		end,
	})
	use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)
	use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion

	-- formatting & linting
	use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
	use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls

	-- treesitter configuration
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})

	-- auto closing
	use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags

	-- git integration
	use("lewis6991/gitsigns.nvim") -- show line modifications on left hand side

	-- speed up load time by optimising lua
	use("lewis6991/impatient.nvim")

	if packer_bootstrap then
		require("packer").sync()
	end
end)
