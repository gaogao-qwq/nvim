return {
    "vhyrro/luarocks.nvim",
	event = "VeryLazy",
    priority = 1001, -- this plugin needs to run before anything else
    opts = {
        rocks = { "magick" },
    },
}
