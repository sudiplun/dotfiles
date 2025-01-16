if true then return{} end --WARN: remove this line to enable 
return {
  'vyfor/cord.nvim',
  build = './build || .\\build',
  event = 'VeryLazy',
  opts = {}, -- calls require('cord').setup()
}
