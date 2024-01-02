local builtin = require('telescope.builtin')

-- Files 
vim.keymap.set('n', '<leader>k', builtin.fd, {}) -- fd or find_files are the same thing (I think?)
vim.keymap.set('n', '<leader>o', builtin.oldfiles, {})
vim.keymap.set('n', '<leader>b', builtin.buffers, {})

-- Strings
vim.keymap.set('n', '<leader>j', builtin.live_grep, {})
vim.keymap.set('n', '<leader>/', builtin.current_buffer_fuzzy_find, {})
vim.keymap.set({ 'n', 'v' }, '<leader>*', builtin.grep_string, {})

-- Search history
vim.keymap.set('n', '<leader>sh', builtin.search_history, {})

-- Command history
vim.keymap.set('n', '<leader>ch', builtin.command_history, {})

--  Marks
vim.keymap.set('n', '<leader>m', builtin.marks, {})

-- Registers
vim.keymap.set({'n', 'v'}, '<leader>r', builtin.registers, { })

-- Plugin Commands
vim.keymap.set('n', '<leader>>', builtin.commands, {})

-- Git commands
vim.keymap.set('n', '<leader>1', builtin.git_branches, {})
vim.keymap.set('n', '<leader>2', builtin.git_status, {})
vim.keymap.set('n', '<leader>3', builtin.git_commits, {})
vim.keymap.set('n', '<leader>git', builtin.git_bcommits, {})
vim.keymap.set('n', '<leader>git', builtin.git_commits, {})
--vim.keymap.set('n', '', builtin.git_branches, {})
--vim.keymap.set('n', '', builtin.git_stash, {})


-- Other
--

-- Git
-- builtin.git_bcommits	Lists buffer's git commits with diff preview and checks them out on <cr>
-- builtin.git_branches	Lists all branches with log preview, checkout action <cr>, track action <C-t> and rebase action<C-r>
-- builtin.git_status	Lists current changes per file with diff preview and add action. (Multi-selection still WIP)
-- builtin.git_stash	Lists stash items in current repository with ability to apply them on <cr>


