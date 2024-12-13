return {
	"NvChad/nvim-colorizer.lua",
	event = "BufReadPre",
  config = function()
        require("colorizer").setup {
            filetypes = {"css","html"},  -- Enable for all filetypes
            user_default_options = {
                RGB = true, -- #RGB hex codes
                RRGGBB = true, -- #RRGGBB hex codes
                names = true, -- "Name" codes like Blue or blue
                RRGGBBAA = true, -- #RRGGBBAA hex codes
                rgb_fn = true, -- CSS rgb() and rgba() functions
                hsl_fn = true, -- CSS hsl() and hsla() functions
                css = true, -- Enable all CSS features
                css_fn = true, -- Enable all CSS *functions*
                mode = "background", -- Set the display mode.
            },
        }
    end
}
