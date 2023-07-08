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
    'Copilot variable useCopilot is: ' ..
        tostring(useCopilot)
)
-- }}}
