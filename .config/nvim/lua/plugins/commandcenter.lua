local status_ok, command_center = pcall(require, 'command_center')
if not status_ok then
  return
end

command_center.add({
	{
		description = "telescope: document symbols",
		cmd = ":Telescope lsp_document_symbols<cr>",
	},
	{
		description = "telescope: snippets",
		cmd = ":Telescope luasnip<cr>"
	},
	{
		description = "telescope: grep project",
		cmd = ":Telescope live_grep<cr>"
	},
	{
		description = "lsp: format document",
		cmd = ":lua vim.lsp.buf.format { async = true }<cr>"
	},
	{
		description = "lsp: rename var",
		cmd = ":lua vim.lsp.buf.rename()<cr>"
	},
	{
		description = "lsp: code action",
		cmd = ":lua vim.lsp.buf.code_action()<cr>"
	},
	{
		description = "nvim: reload neovim config",
		cmd = ":source $MYVIMRC<cr>"
	},
	{
		description = "trouble: show diagnostics panel",
		cmd = ":TroubleToggle<cr>"
	},
}, command_center.mode.ADD_ONLY)