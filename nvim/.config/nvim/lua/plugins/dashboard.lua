return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	config = function()
		local dashboard = require("dashboard")
		dashboard.setup({
			theme = "hyper",
			shortcut_type = "number",
            disable_move = true,
			config = {
                disable_move = true,
				header = {
					"",
					" ███╗   ███╗ ██████╗ ██╗    ██╗██╗      █████╗ ███╗   ██╗██████╗  ",
					" ████╗ ████║██╔═══██╗██║    ██║██║     ██╔══██╗████╗  ██║██╔══██╗ ",
					" ██╔████╔██║██║   ██║██║ █╗ ██║██║     ███████║██╔██╗ ██║██║  ██║ ",
					" ██║╚██╔╝██║██║   ██║██║███╗██║██║     ██╔══██║██║╚██╗██║██║  ██║ ",
					" ██║ ╚═╝ ██║╚██████╔╝╚███╔███╔╝███████╗██║  ██║██║ ╚████║██████╔╝ ",
					" ╚═╝     ╚═╝ ╚═════╝  ╚══╝╚══╝ ╚══════╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝  ",
					"",
				},
				shortcut = {
					{
						desc = "  New File",
						group = "DashboardFooter",
						action = "ene",
						key = "n",
						key_format = " [%s]",
					},
					{
						desc = "  Find Files",
						group = "DashboardFooter",
						action = "Telescope find_files",
						key = "f",
						key_format = " [%s]",
					},
					{
						desc = "  Update",
						group = "DashboardFooter",
						action = "Lazy update",
						key = "u",
						key_format = " [%s]",
					},
					{
                        desc = "  Exit",
                        group = "DashboardFooter",
                        action = "qa",
                        key = "q",
                        key_format = " [%s]"
                    },
				},
                mru = {
                    enable = true,
                    limit = 10,
                }
			},
		})
	end,
	dependencies = { "nvim-tree/nvim-web-devicons" },
}
