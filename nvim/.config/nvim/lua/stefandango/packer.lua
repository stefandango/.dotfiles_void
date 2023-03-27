-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	is_bootstrap = true
	vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
	vim.cmd [[packadd packer.nvim]]
end

require('packer').startup(function(use)
	-- Package manager
	use 'wbthomason/packer.nvim'


	use 'nvim-tree/nvim-web-devicons'
	-- CUSTOM PLUGINS!!!
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	-- FILE EXPLORER #1
	--use { "nvim-telescope/telescope-file-browser.nvim" }

	-- FILE EXPLORER #2
	use {
		'nvim-tree/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons', -- optional, for file icons
		}
	}

	-- use({
	-- 	'rose-pine/neovim',
	-- 	as = 'rose-pine',
	-- 	config = function()
	-- 		vim.cmd('colorscheme rose-pine')
	-- 	end
	-- })
    use('navarasu/onedark.nvim')


	use { -- Highlight, edit, and navigate code
		'nvim-treesitter/nvim-treesitter',
		run = function()
			pcall(require('nvim-treesitter.install').update { with_sync = true })
		end,
	}

	use { -- Additional text objects via treesitter
		'nvim-treesitter/nvim-treesitter-textobjects',
		after = 'nvim-treesitter',
	}

	use('theprimeagen/harpoon')

	use('tpope/vim-fugitive')

	use {
		'VonHeikemen/lsp-zero.nvim',
		requires = {
			-- LSP Support
			-- pv pv
			{'neovim/nvim-lspconfig'},
			{'williamboman/mason.nvim'},
			{'williamboman/mason-lspconfig.nvim'},

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-buffer'},
			{'hrsh7th/cmp-path'},
			{'saadparwaiz1/cmp_luasnip'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'hrsh7th/cmp-nvim-lua'},

			-- Snippets
			{'L3MON4D3/LuaSnip'},
			{'rafamadriz/friendly-snippets'},

			-- My own
			{'j-hui/fidget.nvim'},
            {'hrsh7th/cmp-nvim-lsp-signature-help'}
		}
	}

	-- Cant figure out how to disable by default... use <leader-fd> instead
	-- use({
	-- 	"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
	-- 	config = function()
	-- 		require("lsp_lines").setup()
	-- 	end,
	-- })

	use('nvim-lualine/lualine.nvim') -- Fancier statusline
	use ('lukas-reineke/indent-blankline.nvim') -- Add indentation guides even on blank lines
	use ('numToStr/Comment.nvim') -- "gc" to comment visual regions/lines
	use ('karb94/neoscroll.nvim') -- smoothscroll when using c-d / c-u
    use ('mrjones2014/nvim-ts-rainbow')


	--use ('navarasu/onedark.nvim')
	--use {'romgrk/barbar.nvim', requires = 'nvim-web-devicons'}
	use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}

    use ('mfussenegger/nvim-dap')

    use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }


	-- Add custom plugins to packer from ~/.config/nvim/lua/custom/plugins.lua
	local has_plugins, plugins = pcall(require, 'custom.plugins')
	if has_plugins then
		plugins(use)
	end

	if is_bootstrap then
		require('packer').sync()
	end
end)

-- When we are bootstrapping a configuration, it doesn't
-- make sense to execute the rest of the init.lua.
--
-- You'll need to restart nvim, and then it will work.
if is_bootstrap then
	print '=================================='
	print '    Plugins are being installed'
	print '    Wait until Packer completes,'
	print '       then restart nvim'
	print '=================================='
	return
end

-- Automatically source and re-compile packer whenever you save this init.lua
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
	command = 'source <afile> | PackerCompile',
	group = packer_group,
	pattern = vim.fn.expand '$MYVIMRC',
})
