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
vim.api.nvim_create_autocmd("BufEnter", { command = "set formatoptions-=cro" })

-- wqa with terminals open
vim.api.nvim_create_autocmd("TermEnter", {
	callback = function()
		for _, buffers in ipairs(vim.fn.getbufinfo()) do
			local filetype = vim.api.nvim_buf_get_option(buffers.bufnr, "filetype")
			if filetype == "toggleterm" then
				vim.api.nvim_create_autocmd({ "BufWriteCmd", "FileWriteCmd", "FileAppendCmd" }, {
					buffer = buffers.bufnr,
					command = "q!",
				})
			end
		end
	end,
})
