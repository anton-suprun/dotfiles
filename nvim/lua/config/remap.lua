vim.g.mapleader = " "

-------------------------------------- TIPS ---------------------------------------------
-- To add option+... shortcuts: determine what characters option+{char} sends and use that
-- To add command+... shortcuts: make ⌘-{char} send hexcode in iTerm
-------------------------------------- IDEAS --------------------------------------------
-- Set all window opening shortcuts like project view via ⌘-{char}?

-- Project view
vim.keymap.set({"n", "v", "i"}, "<C-z>", vim.cmd.NvimTreeToggle) -- iTerm ⌘-p sends <C-z>

-------------------------------------- NAVIGATION ---------------------------------------

-- Convenient searching navigation (centers screen on each incremental find)
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")

-- Navigate paragraphs
vim.keymap.set({"n", "v"}, "}", "{zz")
vim.keymap.set({"n", "v"}, "{", "}zz")

-- Previous/next character search switch  (comman is more convenient)
vim.keymap.set({"n", "v"}, ",", ";")
vim.keymap.set({"n", "v"}, ";", ",")

-- half page jumping
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- traverse marks
vim.keymap.set("n", "<C-n>", "]'") -- next mark
vim.keymap.set("n", "<C-p>", "['") -- previous mark

-- cycle tabs
vim.keymap.set("n", "<C-l>", "gt")
vim.keymap.set("n", "<C-h>", "gT")

-------------------------------------- OTHER --------------------------------------------

-- hide highlighted search results
vim.keymap.set("n", "<ESC>", ":nohlsearch<CR>", {silent = true})

-- repeat last ex commad
vim.keymap.set("n", "≥", "@:") -- ≥ is just alt+. (ctrl + . doesn't work for some reason)

-- overwrite text by pasting and not saving the re-placed text to register therefore allowing muptiple overwrites of the same content
vim.keymap.set("v", "<leader>p", [["_dp]])

-- yanks to clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- keeps cursor in place when appending line below
vim.keymap.set("n", "J", "mzJ`z")

-- makes current files executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

----------------------------------------CMD----------------------------------------------

-- Set up key mapping to trigger the custom picker
-- vim.keymap.set('n', '<leader>-', '<Cmd>!echo hello<CR>', { silent = true })
vim.api.nvim_create_user_command("Test", '!ls', {})

--------------------------------------MAGIC----------------------------------------------

-- allows to change current word across the file
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Allows for dragging visually selected chunks of code 
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
