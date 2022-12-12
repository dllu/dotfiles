vim.opt.autoindent = true
vim.opt.autoread = true
vim.opt.backspace = 'indent,eol,start'
vim.opt.clipboard = 'unnamedplus'
vim.opt.encoding = 'utf8'
vim.opt.expandtab = true
vim.opt.fileformats = 'unix,dos,mac'
vim.opt.hidden = true
vim.opt.history = 10000
vim.opt.ignorecase = true
vim.opt.mouse = 'a'
vim.opt.relativenumber = true
vim.opt.ruler = true
vim.opt.shiftwidth = 4
vim.opt.showcmd = true
vim.opt.showmode = true
vim.opt.signcolumn = 'yes'
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.tabstop = 4
vim.opt.visualbell = true
vim.opt.wildmenu = true
vim.opt.wrap = true
function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end
map('', 'j', 'gj')
map('', 'k', 'gk')
require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'itchyny/lightline.vim'
    use 'neovim/nvim-lspconfig'
    use 'EdenEast/nightfox.nvim'
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
end)
require('nightfox').setup({
    options = {
        transparent = true
    }
})
vim.cmd('colorscheme nightfox')
vim.g.lightline = { colorscheme = "nightfox" }

-- treesitter
require'nvim-treesitter.configs'.setup {
    -- A list of parser names, or "all"
    ensure_installed = 'all',

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = true,


    highlight = {
        -- `false` will disable the whole extension
        enable = true,
    }
}
-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end
require'lspconfig'.pylsp.setup{
    on_attach = on_attach,
    settings = {
        pylsp = {
            plugins = {
                pycodestyle = {
                    -- ignore = {'W391'},
                    maxLineLength = 100
                }
            }
        }
    }
}
require'lspconfig'.clangd.setup{
    on_attach = on_attach,
}
require'lspconfig'.rust_analyzer.setup{
    on_attach = on_attach,
    flags = lsp_flags,
    settings = {
        ["rust-analyzer"] = {}
    }
}
