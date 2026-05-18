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

vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0

-- Update to use vim.keymap.set for consistency
local function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.keymap.set(mode, lhs, rhs, options)
end
map('', 'j', 'gj')
map('', 'k', 'gk')

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    {
        "nvim-lualine/lualine.nvim",
        dependencies = "nvim-tree/nvim-web-devicons",
        config = true
    },
    'neovim/nvim-lspconfig',
    'EdenEast/nightfox.nvim',
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        lazy = false,
        build = function()
            if vim.fn.executable("tree-sitter") == 1 then
                vim.cmd("TSUpdate")
            end
        end,
        config = function()
            local treesitter = require("nvim-treesitter")
            local languages = { "python", "c", "cpp", "rust", "javascript" }

            treesitter.setup({
                install_dir = vim.fn.stdpath("data") .. "/site",
            })
            vim.opt.rtp:append(vim.fn.stdpath("data") .. "/lazy/nvim-treesitter/runtime")

            if vim.fn.executable("tree-sitter") == 1 then
                treesitter.install(languages)
            end

            vim.api.nvim_create_autocmd("FileType", {
                pattern = languages,
                callback = function(args)
                    pcall(vim.treesitter.start, args.buf)
                end,
            })
        end,
    },
}, {
    rocks = {
        enabled = false,
    },
})

require('nightfox').setup({
    options = {
        transparent = true
    }
})
vim.cmd('colorscheme nightfox')

-- Mappings for diagnostics
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- LSP on_attach
local on_attach = function(client, bufnr)
    vim.bo[bufnr].omnifunc = 'v:lua.vim.lsp.omnifunc'

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

-- LSP servers using the new vim.lsp.config API
vim.lsp.config('ruff', {
    on_attach = on_attach,
    init_options = {
        settings = {
            args = {},
        }
    }
})
if vim.fn.executable('ruff') == 1 then
    vim.lsp.enable('ruff')
end

vim.lsp.config('clangd', {
    on_attach = on_attach,
})
if vim.fn.executable('clangd') == 1 then
    vim.lsp.enable('clangd')
end

vim.lsp.config('rust_analyzer', {
    on_attach = on_attach,
    settings = {
        ["rust-analyzer"] = {}
    }
})
if vim.fn.executable('rust-analyzer') == 1 then
    vim.lsp.enable('rust_analyzer')
end

require('lualine').setup {
    options = {
        icons_enabled = true,
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {{'filename', path = 2}},
        lualine_x = {'encoding', {'fileformat', symbols = { unix = 'unix', dos = 'dos', mac = 'mac' }}, {'filetype', icons_enabled = false}},
        lualine_y = {'progress'},
        lualine_z = {'location'},
    }
}
