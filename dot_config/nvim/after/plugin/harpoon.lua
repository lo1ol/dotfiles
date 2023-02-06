require("harpoon").setup({ 
    global_settings = {
      -- sets harpoon to run the command immediately as it's passed to the terminal when calling `sendCommand`.
      enter_on_sendcmd = true,
      mark_branch = true,
    }
})

local mark = require('harpoon.mark')
local ui = require('harpoon.ui')
local term = require('harpoon.term')
local cmd_ui = require('harpoon.cmd-ui')

vim.keymap.set('n', '<leader>a', mark.add_file)
vim.keymap.set('n', '<C-e>', ui.toggle_quick_menu)

vim.keymap.set('n', '<A-Right>', ui.nav_next)
vim.keymap.set('n', '<A-Left>', ui.nav_prev)

vim.keymap.set('n', '<leader>sc', cmd_ui.toggle_quick_menu)

vim.keymap.set('n', '<C-b>', function() term.clear_all(); term.sendCommand(1,1); term.gotoTerminal(1); end)
vim.keymap.set('n', '<C-r>', function() term.clear_all(); term.sendCommand(1,2); term.gotoTerminal(1); end)
