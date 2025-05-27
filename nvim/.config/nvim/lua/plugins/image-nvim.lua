return {
    "3rd/image.nvim",
    build = false,
    opts = {},
    config = function ()
        local image = require("image")
        image.setup({
            backend = "ueberzug",
            processor = "magick_cli",
        })
    end
}
