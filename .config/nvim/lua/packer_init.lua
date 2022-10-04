local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  return
end

-- Autocommand that reloads neovim whenever you save the packer_init.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer.lua source <afile> | PackerCompile
  augroup end
]])

return packer.startup(function(use)

	-- packer
	use 'wbthomason/packer.nvim'

	-- vim commentary
	use 'tpope/vim-commentary'

	-- treesitter
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

	-- lsp-config
	use 'neovim/nvim-lspconfig'

	-- nvim-cmp
	use { 'hrsh7th/nvim-cmp', requires = { { 'L3MON4D3/LuaSnip' }, { 'saadparwaiz1/cmp_luasnip' } } }

	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'

	-- telescope
	use { 'nvim-telescope/telescope.nvim', tag = '0.1.0', requires = { { 'nvim-lua/plenary.nvim' }, { 'kyazdani42/nvim-web-devicons' } } }

	use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
	use { 'benfowler/telescope-luasnip.nvim' }
	use 'gfeiyou/command-center.nvim'

	-- lab.nvim
	use { '0x100101/lab.nvim', run = 'cd js && npm ci' }

	-- indent blankline
	use "lukas-reineke/indent-blankline.nvim"

	-- onedark
	use 'navarasu/onedark.nvim'

end)