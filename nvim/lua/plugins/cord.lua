if true then return {} end
--discord server
return {
	'vyfor/cord.nvim',
	build = './build || .\\build',
	event = 'VeryLazy',
	opts = {}, -- calls require('cord').setup()
}
