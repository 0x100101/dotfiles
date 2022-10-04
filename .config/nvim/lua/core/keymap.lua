local function map(mode, lhs, rhs, opts)
  vim.keymap.set(mode, lhs, rhs, opts)
end

vim.g.mapleader = ' '

-----------------------------------------------------------
-- General
-----------------------------------------------------------

map('n', '<leader>\\', ':vsplit<cr>')
map('n', '<leader>-', ':hsplit<cr>')

map('n', '<leader>s', ':update<cr>')                         -- Save (Like ":w", but only write if the file has been modified.)
map('n', '<leader>S', ':wa<cr>')                             -- Save all
map('n', '<leader>q', ':q<cr>')                              -- Close
map('n', '<leader>Q', ':qa<cr>')                             -- Close all
map('n', '<leader>c', ':bp|bd #<cr>')                        -- Close current buffer and try to switch to another

-----------------------------------------------------------
-- Telescope
-----------------------------------------------------------

local builtin = require('telescope.builtin')

map('n', '<F1>', builtin.find_files)
map('n', '<F2>', builtin.buffers)
map('n', '<F3>', ':Telescope luasnip<cr>')
map('n', '<F12>', ':Telescope command_center<cr>')

-----------------------------------------------------------
-- Lab.nvim
-----------------------------------------------------------

map('n', '<F4>', ':Lab code stop<cr>')
map('n', '<F5>', ':Lab code run<cr>')
map('n', '<F6>', ':Lab code panel<cr>')
