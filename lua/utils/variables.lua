local M = {}

-- LuaFormatter off
M.xdg_config_home = vim.fn.expand('$XDG_CONFIG_HOME')
M.nvim_appname = vim.fn.expand('$NVIM_APPNAME')
M.edit_path = M.xdg_config_home .. '/' .. M.nvim_appname .. '/lua'
M.xdg_data_home = vim.fn.expand('$XDG_DATA_HOME')
M.lazyvim_path = M.xdg_data_home .. '/' .. M.nvim_appname .. '/lazy/LazyVim/lua/lazyvim'
-- LuaFormatter on

return M
