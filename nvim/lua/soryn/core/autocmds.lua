-- highlight the yank (duh)
vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("highlight_yank", {}),
	desc = "Hightlight selection on yank",
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 500 })
	end,
})

-- don't comment on newline
vim.api.nvim_create_autocmd("BufEnter", { command = [[set formatoptions-=cro]] })
