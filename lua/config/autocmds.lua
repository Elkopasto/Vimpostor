-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

vim.api.nvim_create_autocmd({ "FileType", "BufWinEnter" }, {
  pattern = { "markdown", "*.md" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
    local notes_dir = vim.fn.expand("~/notes")
    if vim.fn.expand("%:p"):find(notes_dir, 1, true) then
      vim.opt_local.spell = true
      vim.opt_local.spelllang = "en_us"
      vim.api.nvim_set_hl(0, "SpellBad", { undercurl = true, sp = "#f7768e" })
    end
  end,
})
