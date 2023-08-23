-- Require the os library for os.time()
local os = require('os')

-- Your ASCII art table
local asciiart = require('utils.ascii-art')
local new_art = {
  asciiart.floppy,
  asciiart.computer,
  asciiart.nixos,
  asciiart.neovim_rusto,
  asciiart.arrow,
  asciiart.cassette,
  asciiart.turntables,
  asciiart.toilet_paper
}

-- variables for width stuff
local trunc_width = 50
local width = vim.api.nvim_win_get_width(0)

-- {{{ check_width
-- check if should use small_pictures
local function check_width()
  if width <= trunc_width then
    local small_pictures = false
    print('small_pictures: ' .. tostring(small_pictures))
    print('width is <= ' .. trunc_width)
  else
    local small_pictures = true
    print('small_pictures: ' .. tostring(small_pictures))
    print('width is > ' .. trunc_width)
  end
end

check_width()
-- }}}

-- Table to store the indexes of ASCII art with
-- lines less than 50 characters
local valid_indexes = {}

-- Iterate over each ASCII art
for i, art in ipairs(new_art) do
  -- Assume the art is valid until proven otherwise
  local is_valid = true

  -- Split the ASCII art into lines
  for line in art:gmatch('[^\r\n]+') do
    -- Check if the line length is more than trunc_width (50)
    if #line > trunc_width then
      is_valid = false
      break
    end
  end

  -- If the art is still valid, store its index
  if is_valid then table.insert(valid_indexes, i) end
end

-- Initialize the random number generator
math.randomseed(os.time())

-- Select a random index from valid_indexes
local random_index = valid_indexes[math.random(#valid_indexes)]

-- Print the random ASCII art
print('Randomly selected ASCII art with all lines shorter than 50 characters:')
print(new_art[random_index])

-- {{{ TODO: show starter if buffers deleted
local open_starter_if_empty_buffer = function()
  local buf_id = vim.api.nvim_get_current_buf()
  local is_empty = vim.api.nvim_buf_get_name(buf_id) == '' and
                     vim.bo[buf_id].filetype == ''
  if not is_empty then return end

  vim.cmd('Neotree close')
  require('mini.starter').open()
  vim.cmd(buf_id .. 'bwipeout')
end

_G.my_bufdelete = function(...)
  require('mini.bufremove').delete(...)
  open_starter_if_empty_buffer()
end

_G.my_bufwipeout = function(...)
  require('mini.bufremove').wipeout(...)
  open_starter_if_empty_buffer()
end
-- }}}

-- {{{ original setup for reference
--[==[
opts = function()
  local logo = table.concat({
    "            ██╗      █████╗ ███████╗██╗   ██╗██╗   ██╗██╗███╗   ███╗          Z",
    "            ██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝██║   ██║██║████╗ ████║      Z    ",
    "            ██║     ███████║  ███╔╝  ╚████╔╝ ██║   ██║██║██╔████╔██║   z       ",
    "            ██║     ██╔══██║ ███╔╝    ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║ z         ",
    "            ███████╗██║  ██║███████╗   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║           ",
    "            ╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝           ",
  }, "\n")
  local pad = string.rep(" ", 22)
  local new_section = function(name, action, section)
    return { name = name, action = action, section = pad .. section }
  end

  local starter = require("mini.starter")
  --stylua: ignore
  local config = {
    evaluate_single = true,
    header = logo,
    items = {
      new_section("Find file",    "Telescope find_files", "Telescope"),
      new_section("Recent files", "Telescope oldfiles",   "Telescope"),
      new_section("Grep text",    "Telescope live_grep",  "Telescope"),
      new_section("init.lua",     "e $MYVIMRC",           "Config"),
      new_section("Lazy",         "Lazy",                 "Config"),
      new_section("New file",     "ene | startinsert",    "Built-in"),
      new_section("Quit",         "qa",                   "Built-in"),
      new_section("Session restore", [[lua require("persistence").load()]], "Session"),
    },
    content_hooks = {
      starter.gen_hook.adding_bullet(pad .. "░ ", false),
      starter.gen_hook.aligning("center", "center"),
    },
  }
  return config
end
--]==]
-- }}}

-- {{{
-- TODO:
-- FIX:
-- HACK:
local number_width = vim.o.numberwidth
local fold_column = vim.o.foldcolumn
-- meaning the space from the left where the
-- padding of mini.starter starts
local left_padding = 7
local option_longest_half = 6

-- subtracts all variables to get the final padding
local subtracted_padding = width - number_width - fold_column - left_padding - 2

local in_half = function(num) return num / 2 end
local round_even = function(num) return math.floor(num / 2 + 0.5) * 2 end

local other_final = round_even(in_half(subtracted_padding))
-- subtract by half the length of the longest menu item (Recent files)
local final_width = other_final - (12 / 2)
-- }}}

return {
  {
    'echasnovski/mini.starter',
    opts = function()
      local pad = string.rep(' ', final_width)

      local new_section = function(name, action, section)
        return { name = name, action = action, section = pad .. section }
      end

      local starter = require('mini.starter')
      -- stylua: ignore
      local config = {
        evaluate_single = true,
        header = new_art[random_index],
        items = {
          new_section('Find file', 'Telescope find_files', 'Telescope'),
          new_section('Recent files', 'Telescope oldfiles', 'Telescope'),
          new_section('Grep text', 'Telescope live_grep', 'Telescope'),
          new_section('init.lua', 'e $MYVIMRC', 'Config'),
          new_section('Lazy', 'Lazy', 'Config'),
          new_section('New file', 'ene | startinsert', 'Built-in'),
          new_section('Quit', 'qa', 'Built-in')
        },
        content_hooks = {
          starter.gen_hook.adding_bullet(pad .. '░ ', false),
          starter.gen_hook.aligning('center', 'center')
        }
      }
      -- for _, new_section in ipairs(config.items) do
      --   local first_entry = new_section[1]
      --   print(first_entry)
      -- end
      return config
    end
  }
}
