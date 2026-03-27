-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Delete line (Option + Backspace)
map("i", "<A-BS>", "<C-w>", opts) -- works like VS Code: delete previous word
map("n", "<A-BS>", "db", opts) -- delete word before cursor in normal mode
map("v", "<A-BS>", "d", opts)

-- Jump by word (Option + Left/Right)
map("n", "<A-Left>", "b", opts)
map("n", "<A-Right>", "w", opts)
map("i", "<A-Left>", "<C-o>b", opts)
map("i", "<A-Right>", "<C-o>w", opts)

-- Duplicate line/selection (Alt+Shift+Up/Down like VS Code)
-- Normal mode: duplicate current line up/down
map("n", "<A-S-Down>", "yyp", opts)
map("n", "<A-S-Up>", "yyP", opts)
-- Visual mode: duplicate selection up/down and keep selection
map("v", "<A-S-Down>", ":t'><CR>gv", opts)
map("v", "<A-S-Up>", ":t'<-1<CR>gv", opts)
-- Insert mode: duplicate current line up/down and stay in insert
map("i", "<A-S-Down>", "<Esc>yypgi", opts)
map("i", "<A-S-Up>", "<Esc>yyPgi", opts)

-- Notes
local notes_dir = vim.fn.expand("~/notes")
map("n", "<leader>nn", function()
  vim.fn.mkdir(notes_dir, "p")
  Snacks.picker.files({ cwd = notes_dir, title = "Notes" })
end, { desc = "Find notes" })
map("n", "<leader>ng", function()
  Snacks.picker.grep({ cwd = notes_dir, title = "Search Notes" })
end, { desc = "Grep notes" })
map("n", "<leader>nN", function()
  vim.fn.mkdir(notes_dir, "p")
  local name = vim.fn.input("Note name: ")
  if name ~= "" then
    vim.cmd("edit " .. notes_dir .. "/" .. name .. ".md")
  end
end, { desc = "New note" })
map("n", "<leader>ns", function()
  vim.cmd("edit /tmp/scratch.md")
end, { desc = "Scratch note" })
map("n", "<leader>nS", function()
  vim.fn.writefile({}, "/tmp/scratch.md")
  vim.cmd("edit /tmp/scratch.md")
  vim.cmd("checktime")
end, { desc = "Wipe and open the scratch note" })

-- Move line/selection (Alt+Up/Down like VS Code)
-- Normal mode: move current line
map("n", "<A-Down>", ":m .+1<CR>==", opts)
map("n", "<A-Up>", ":m .-2<CR>==", opts)
-- Visual mode: move block and keep it selected
map("v", "<A-Down>", ":m '>+1<CR>gv=gv", opts)
map("v", "<A-Up>", ":m '<-2<CR>gv=gv", opts)
-- Insert mode: move current line and return to insert at same spot
map("i", "<A-Down>", "<Esc>:m .+1<CR>==gi", opts)
map("i", "<A-Up>", "<Esc>:m .-2<CR>==gi", opts)
