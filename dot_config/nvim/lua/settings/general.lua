local vim = vim

local o = vim.o -- global options
o.nocompatible=true            -- disable compatibility to old-time vi
o.showmatch=true               -- show matching 
o.mouse='v'                    -- middle-click paste with 
o.hlsearch=true                -- highlight search 
o.incsearch=true               -- incremental search
o.tabstop=4                    -- number of columns occupied by a tab 
o.softtabstop=4                -- see multiple spaces as tabstops so <BS> does the right thing
o.expandtab=true               -- converts tabs to white space
o.shiftwidth=4                 -- width for autoindents
o.autoindent=true              -- indent a new line the same amount as the line just typed
o.wildmode='longest,list'      -- get bash-like tab completions
o.syntax='on'                  -- syntax highlighting
o.mouse='a'                    -- enable mouse click
o.clipboard='unnamedplus'      -- using system clipboard
o.ttyfast=true                 -- Speed up scrolling in Vim


local wo = vim.wo -- window options
wo.number=true
wo.relativenumber=true


-- start nvim at last position
vim.cmd([[autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif]])
