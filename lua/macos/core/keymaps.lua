vim.g.mapleader = ' ' -- set the leader key

local keymap = vim.keymap

-- disable highlights
keymap.set('n', '<leader>nh', ':nohl<CR>')

-- don't yank characters deleted with 'x'
keymap.set('n', 'x', '"_x')

-- replace ':' with ';'
keymap.set('n', ';', ':')

keymap.set('n', '<leader>sv', '<C-w>v') -- split window vertically
keymap.set('n', '<leader>sh', '<C-w>s') -- split window horizontally
keymap.set('n', '<leader>se', '<C-w>=') -- make split windows equal width & height
keymap.set('n', '<leader>sx', ':close<CR>') -- close current split window

keymap.set('n', '<leader>to', ':tabnew<CR>') -- open new tab
keymap.set('n', '<leader>tx', ':tabclose<CR>') -- close current tab
keymap.set('n', '<leader>tn', ':tabn<CR>') --  go to next tab
keymap.set('n', '<leader>tp', ':tabp<CR>') --  go to previous tab

keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>') -- toggle file tree viewer

keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>') -- find files within current working directory, respects .gitignore
keymap.set('n', '<leader>fs', '<cmd>Telescope live_grep<cr>') -- find string in current working directory as you type
keymap.set('n', '<leader>fc', '<cmd>Telescope grep_string<cr>') -- find string under cursor in current working directory
keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<cr>') -- list open buffers in current neovim instance
keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags<cr>') -- list available help tags

--[[
keymap.set(
    'n',
    '<leader>g',
    ":lua require('ryanbaker.functions.incguard').write_include_guard()<CR>",
    { noremap=true, silent=true }
)
--]]

vim.api.nvim_create_augroup("cpp-keymaps", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
    group = "cpp-keymaps",
    pattern = "cpp",
    callback = function()
        keymap.set('n', '<leader>cx', ':!clang++ -std=c++23 % -o exe && ./exe<CR>', { noremap = true, buffer = true, desc = "Compile and execute a C++ file" })
    end,
})

vim.api.nvim_create_user_command("ZoomToPresent", function()
    os.execute('osascript -e \'tell application "System Events" to keystroke "0" using command down\'')
    for i = 1, 21 do
        os.execute('osascript -e \'tell application "System Events" to keystroke "+" using command down\'')
    end
end, {})
