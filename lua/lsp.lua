-- Setup neovim lua configuration
require('neodev').setup()

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- LSP Servers
local lspconfig = require('lspconfig')
lspconfig.rust_analyzer.setup {
	cmd = { "rust-analyzer" },
	['rust-analyzer'] = {
		checkOnSave = {
			command = 'clippy',
		},
	},
}

lspconfig.racket_langserver.setup {}

lspconfig.nil_ls.setup {
  autostart = true,
  capabilities = caps,
  cmd = { "nil" },
  settings = {
	['nil'] = {
	  testSetting = 42,
	  formatting = {
		command = { "nixpkgs-fmt" },
	  },
	},
  },
}
