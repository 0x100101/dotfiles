local status_ok, cmp = pcall(require, 'cmp')
if not status_ok then
	return
end

local luasnip = require("luasnip")

local kind_icons = {
	Text = "",
	Method = "",
	Function = "",
	Constructor = "",
	Field = "",
	Variable = "",
	Class = "ﴯ",
	Interface = "",
	Module = "",
	Property = "ﰠ",
	Unit = "",
	Value = "",
	Enum = "",
	Keyword = "",
	Snippet = "",
	Color = "",
	File = "",
	Reference = "",
	Folder = "",
	EnumMember = "",
	Constant = "",
	Struct = "",
	Event = "",
	Operator = "",
	TypeParameter = ""
}

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	window = {
		completion = cmp.config.window.bordered(),
	},
	formatting = {
		format = function(entry, vim_item)
			-- This concatonates the icons with the name of the item kind
			vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)
			-- Source
			vim_item.menu = ({
				buffer = "[Buffer]",
				nvim_lsp = "[LSP]",
				luasnip = "[LuaSnip]",
				nvim_lua = "[Lua]",
				path = "[Path]",
			})[entry.source.name]
			return vim_item
		end
	},
	mapping = cmp.mapping.preset.insert({
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = true }),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end)
	}),
	sources = cmp.config.sources({
		{ name = 'luasnip', keyword_length = 2, max_item_count = 10 },
		{ name = 'nvim_lsp', keyword_length = 1, max_item_count = 20 },
		{ name = 'nvim_lsp_signature_help' },
		{ name = 'lab.quick_data', keyword_length = 4 }
	},
	{
		{ name = 'buffer', keyword_length = 3, max_item_count = 10 },
	}),
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = 'buffer' }
	}
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = 'path' }
	}, {
		{ name = 'cmdline' }
	})
})

-- Setup lspconfig with nvim-cmp.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- List of lsp servers that I've installed..
-- tsserver:    npm i -g typescript typescript-language-server
-- html:        npm i -g vscode-langservers-extracted
-- cssls:       npm i -g vscode-langservers-extracted
-- emmet:       npm i -g emmet-ls
-- svelte:      npm i -g svelte-language-server
-- tailwindcss  npm i -g @tailwindcss/language-server
-- eslint       npm i -g vscode-langservers-extracted
-- jsonls       npm i -g vscode-langservers-extracted
-- volar (vue3) npm i -g @volar/vue-language-server
-- theme_check  brew tap shopify/shopify; brew install theme-check

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local opts = { noremap = true, silent = true }
	vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
end

local servers = { 'html', 'cssls', 'svelte', 'tailwindcss', 'eslint', 'tsserver', 'jsonls', 'volar' }

for _, lsp in pairs(servers) do
	require('lspconfig')[lsp].setup {
		on_attach = on_attach,
		capabilities = capabilities
	}
end
