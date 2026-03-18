-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Prioritise .git root over LSP root so monorepos/workspaces don't scope
-- tools (Telescope grep, neo-tree, etc.) to a sub-package directory.
vim.g.root_spec = { { ".git" }, "lsp", "cwd" }
