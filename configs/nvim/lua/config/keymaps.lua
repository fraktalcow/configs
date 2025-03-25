-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- Use vim.keymap.set for a cleaner API (requires Neovim 0.7+)
local opts = { noremap = true, silent = true }

-- F1: Open help documentation
vim.keymap.set("n", "<F1>", ":help<CR>", opts)

-- F2: Toggle the file explorer (assuming you use nvim-tree)
vim.keymap.set("n", "<F2>", ":NvimTreeToggle<CR>", opts)

-- F3: Toggle a terminal window (using ToggleTerm plugin, for example)
vim.keymap.set("n", "<F3>", ":ToggleTerm<CR>", opts)

-- F4: Open the quickfix list (useful for diagnostics or search results)
vim.keymap.set("n", "<F4>", ":copen<CR>", opts)

-- F5: Launch Telescope for file finding (or any file search tool you prefer)
vim.keymap.set("n", "<F5>", ":Telescope find_files<CR>", opts)

-- F6: Navigate to the previous buffer
vim.keymap.set("n", "<F6>", ":bprevious<CR>", opts)

-- F7: Navigate to the next buffer
vim.keymap.set("n", "<F7>", ":bnext<CR>", opts)

-- F8: Show diagnostics in a floating window (using built-in LSP)
vim.keymap.set("n", "<F8>", ":lua vim.diagnostic.open_float()<CR>", opts)

-- F9: Toggle an outline view (for instance, SymbolsOutline for code structure)
vim.keymap.set("n", "<F9>", ":SymbolsOutline<CR>", opts)

