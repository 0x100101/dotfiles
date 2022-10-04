local status_ok, telescope = pcall(require, 'telescope')
if not status_ok then
  return
end

telescope.setup {
	pickers = {
		find_files = {
			hidden = true,
		},
		buffers = {
			only_cwd = true,
		}
	}
}

telescope.load_extension('command_center')
telescope.load_extension('luasnip')
telescope.load_extension('fzf')
