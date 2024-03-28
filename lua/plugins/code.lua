return {
	{
		'echasnovski/mini.nvim',
		version = '*',
		config = function()
			require('mini.pairs').setup()
			local hipatterns = require 'mini.hipatterns'
			hipatterns.setup {
				highlighters = {
					-- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
					fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
					hack = { pattern = '%f[%w]()HACK()%f[%W]', group = 'MiniHipatternsHack' },
					todo = { pattern = '%f[%w]()TODO()%f[%W]', group = 'MiniHipatternsTodo' },
					note = { pattern = '%f[%w]()NOTE()%f[%W]', group = 'MiniHipatternsNote' },

					-- Highlight hex color strings (`#rrggbb`) using that color
					hex_color = hipatterns.gen_highlighter.hex_color(),
				},
			}
			require('mini.align').setup()
			require('mini.surround').setup()
			require('mini.starter').setup({
				header = table.concat({
					[[                                  __]],
					[[     ___     ___    ___   __  __ /\_\    ___ ___]],
					[[    / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\]],
					[[   /\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \]],
					[[   \ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
					[[    \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
				}, "\n"),
			})
		end,
	},
	{
		'numToStr/Comment.nvim',
		opts = {
			-- add any options here
			opleader = {
				---Line-comment toggle keymap
				line = '<leader>/',
				---Block-comment toggle keymap
				block = '<leader>\\',
			},
		},
		lazy = false,
	},
	{
		"nvimtools/none-ls.nvim",
		config = function()
			local null_ls = require('null-ls')

			null_ls.setup({
				null_ls.builtins.formatting.eslint
			})
		end
	},
	-- Go templates
	{ "fatih/vim-go" },

	-- Lisps

	{
		"Olical/conjure",
		ft = { "clojure", "fennel", "racket" }, -- etc
		-- [Optional] cmp-conjure for cmp
		dependencies = {
			{
				"PaterJason/cmp-conjure",
				config = function()
					local cmp = require("cmp")
					local config = cmp.get_config()
					table.insert(config.sources, {
						name = "buffer",
						option = {
							sources = {
								{ name = "conjure" },
							},
						},
					})
					cmp.setup(config)
				end,
			},
		},
		config = function(_, opts)
			require("conjure.main").main()
			require("conjure.mapping")["on-filetype"]()
		end,
		init = function()
			-- Set configuration options here
			vim.g["conjure#debug"] = true
		end,
	},
	{ "tpope/vim-sleuth" }

}
