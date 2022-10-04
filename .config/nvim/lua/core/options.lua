local g = vim.g                                        -- global variables
local opt = vim.opt                                    -- set options (global/buffer/windows-scoped)

-----------------------------------------------------------
-- General
-----------------------------------------------------------
opt.mouse = 'a'                                        -- enable mouse support
opt.clipboard = 'unnamedplus'                          -- copy/paste to system clipboard
opt.swapfile = false                                   -- don't use swapfile
opt.autoread = true                                    -- auto reload files that have changed on disk
opt.hidden = true                                      -- allows changing of buffers without saving
opt.completeopt = 'menu,menuone,noselect'              -- suggested by nvim-cmp.
opt.spell = true                                       -- turn on spell check
opt.spelllang = 'en_us'                                --

-----------------------------------------------------------
-- Text
-----------------------------------------------------------
opt.wrap = false                                       -- don't wrap text
opt.smartindent = true                                 -- auto indent new lines
opt.expandtab = false                                  -- use tabs
opt.tabstop = 3                                        -- tabs are shown as x spaces
opt.shiftwidth = 3                                     --

-----------------------------------------------------------
-- UI
-----------------------------------------------------------
opt.termguicolors = true                               -- enable 24-bit RGB colors
opt.number = true                                      -- show line number
opt.relativenumber = true                              -- use relative numbers
opt.laststatus = 3                                     -- use one global statusline
opt.cmdheight = 0                                      -- hide command bar while not in use
opt.signcolumn = 'yes'                                 -- show the sign col by default (prevent jumping when signs are added)
opt.pumblend = 5                                       -- give popups opacity

