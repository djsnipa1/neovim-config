return {
  { 'mattn/emmet-vim',
    init = function()
      vim.g.user_emmet_install_global = 0
      -- vim.g.user_emmet_leader_key='<C-Y>'
      vim.cmd("autocmd FileType html,css,svelte EmmetInstall")
      vim.g.user_emmet_settings = {
        svelte = {
          extends = 'html',
        },
      }
    end
  }
}
