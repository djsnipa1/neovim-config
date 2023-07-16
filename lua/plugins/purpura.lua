return {
  {
    'yassinebridi/vim-purpura',
    priority = 1000,
    enabled = false,
    config = function()
      vim.cmd [[
        set background=dark
        set termguicolors
        let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
        let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

        colorscheme purpura
      ]]
    end
  }
}
