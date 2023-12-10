local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

local function eopts(extra)
    local r = {}
    for k,v in pairs(opts) do r[k] = v end
    for k,v in pairs(extra) do r[k] = v end
    return r
end

-- Shorten function name
local keymap = vim.keymap.set

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "


-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --

keymap("n", "<Leader>e", ":Lex 15<CR>", eopts({ desc = "Open Explorer" }))
keymap("n", "<C-p>", ":Telescope find_files<CR>", eopts({ desc = "Telescope find files" }))
keymap("n", "<Leader>p", ":Telescope<CR>", eopts({ desc = "Telescope main menu" }))

-- Better window navigation
-- keymap("n", "<C-h>", "<C-w>h", opts)
-- keymap("n", "<C-j>", "<C-w>j", opts)
-- keymap("n", "<C-k>", "<C-w>k", opts)
-- keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-w><C-Up>", ":resize -6<CR>", opts)
keymap("n", "<C-w><C-Down>", ":resize +6<CR>", opts)
keymap("n", "<C-w><C-Left>", ":vertical resize -8<CR>", opts)
keymap("n", "<C-w><C-Right>", ":vertical resize +8<CR>", opts)

-- Navigate buffers
keymap("n", "<C-l>", ":bnext<CR>", opts)
keymap("n", "<C-h>", ":bprevious<CR>", opts)

-- Move text up and down
-- keymap("n", "<A-j>", ":m .+1<CR>==", opts)
-- keymap("n", "<A-k>", ":m .-2<CR>==", opts)

-- Insert --
-- Press jk fast to exit insert mode 
keymap("i", "jk", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv^", opts)
keymap("v", ">", ">gv^", opts)

-- Move text up and down
keymap("v", "<C-Down>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<C-Up>", ":m '<-2<CR>gv=gv", opts)

-- don't replace clipboard when pasting over a selection
keymap("v", "p", '"_dP', opts)

