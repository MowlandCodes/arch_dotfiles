return {
	"rcarriga/nvim-notify",
	config = function()
		local notify = require("notify")
		vim.opt.termguicolors = true
		vim.notify = notify
		vim.opt.showcmd = false
		vim.opt.cmdheight = 0
		vim.opt.laststatus = 2

		vim.api.nvim_create_autocmd("BufWritePost", {
			callback = function()
				local filename = vim.fn.expand("%:t") -- Get the full file path
				notify("File saved successfully: " .. filename, "info", { title = "Save Notification" })
			end,
		})

		local function override_echo()
			local _ = vim.api.nvim_echo
			vim.api.nvim_echo = function(messages, _, _)
				for _, message in ipairs(messages) do
					notify(message[1], "info", { title = "Message" })
				end
			end
		end

		local function override_out_write()
			local _ = vim.api.nvim_out_write
			vim.api.nvim_out_write = function(msg)
				notify(msg, "info", { title = "Output" })
			end
		end

		override_echo()
		override_out_write()

		notify.setup({
			background_colour = "#181926",
			fps = 60,
			render = "default",
			stages = "slide",
			timeout = 1700,
			max_height = 10,
			max_width = 80,
		})
	end,
}
