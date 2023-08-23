------------------------------------
--   ┬  ┬ ┐┬─┐  ┌┐┐┌─┐┌┐┐┬─┐┐─┐   --
--   │  │ ││─┤  ││││ │ │ ├─ └─┐   --
--   ┆─┘┆─┘┘ ┆  ┆└┘┘─┘ ┆ ┴─┘──┘   --
------------------------------------
-- Random notes I wanted to keep  --
-- about lua                      --
------------------------------------
-- put this whenever the code below should be skipped
-- if true then return {} end
--
-- {{{ lazy.nvim keys table example
-- This example shows how do do different modes
{
  '<C-i>',
  '<cmd>IconPickerInsert<cr>',
  desc = 'Icon Picker Insert',
  mode = { 'n', 'i' }
}
-- }}}

-- {{{ simple variable boolean if else
local useCopilot = true

if useCopilot == true then
    print('useCopilot is true')
else
    print('useCopilot is false')
end
-- }}}

-- {{{ Expirements
-- delete 1 - to uncomment 2nd code block
---[[
print 'Lua is love'
--[=[]]
  print "Lua is life"
--]=]

if not useOriginalPlugin then
  print(
    'This code will be ignored if useOriginalPlugin is true'
  )
  -- other code...
end

-- if true == false then useOriginalPlugin = true end
-- }}}

-- {{{ print variable
local useCopilot = true
local useOriginalPlugin = true

print(
  'Copilot variable useCopilot is: ' .. tostring(useCopilot)
)
-- }}}

-- {{{ animation
local animation = function()
  local stickFigure = {
    ' O \n/|\\\n /\\',
    ' O \n\\|/\n /\\',
    ' O \n/|\\\n /\\',
    ' O \n\\|/\n /\\'
  }
  local position = 1
  local direction = 1

  while true do
    os.execute('clear') -- clear the console
    print(stickFigure[position]) -- print the current frame
    os.execute('sleep 0.2') -- wait for a short time

    -- update the position and direction for the next frame
    position = position + direction
    if position == #stickFigure then
      direction = -1
    elseif position == 1 then
      direction = 1
    end
  end
end

-- }}}
