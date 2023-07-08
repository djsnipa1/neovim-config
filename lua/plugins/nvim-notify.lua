return {
  "rcarriga/nvim-notify",
  cond = function()
    -- find out how many columns wide the screen is
    local handle = io.popen("tput cols")
    local result = handle:read("*n")
    handle:close()
    -- print(result)

    if vim.o.columns > result then
      return true
      -- require("lazy").load({ plugins = { "rcarriga/nvim-notify" } })
      -- return {"rcarriga/nvim-notify", enabled = true}
    else
      return false
      --     return {"rcarriga/nvim-notify", enabled = false}
    end
  end,

}
