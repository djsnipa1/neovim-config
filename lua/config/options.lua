-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local function set_options(options)
  for key, value in pairs(options) do
    if vim.o[key] ~= nil then
      vim.o[key] = value
    elseif vim.bo[key] ~= nil then
      vim.bo[key] = value
    elseif vim.wo[key] ~= nil then
      vim.wo[key] = value
    end
  end
end

set_options({
  -- I made this an autocmd for lua files
  -- foldmethod = 'marker'
  -- these are just examples
  -- number = true,  -- Show line numbers
  -- hlsearch = true,  -- Highlight search results
  -- expandtab = true,  -- Use spaces instead of tabs
  -- tabstop = 4,  -- Number of spaces a tab counts for
  -- wrap = false,  -- Do not wrap long lines
})
