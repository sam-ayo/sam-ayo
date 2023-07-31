local cmp_status, cmp = pcall(require, 'cmp')
if not cmp_status then
    print('Cannot load nvim_cmp')
    return
end

local luasnip_status, luasnip = pcall(require, 'luasnip')
if not luasnip_status then
    print('Cannot load luasnip')
    return
end

-- load friendly-snippets
require("luasnip.loaders.from_vscode").lazy_load()

vim.opt.completeopt = 'menu,menuone,noselect'


cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body) -- For `luasnip` users.
        end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-k>'] = cmp.mapping.select_prev_item(),
        ['<C-j>'] = cmp.mapping.select_next_item(),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
    }),
    sources = cmp.config.sources({
        { name = 'luasnip' }, -- snippet engine
        { name = 'buffer' }, -- suggest text withing current buffer 
        { name = 'path' }, -- suggest file system paths
    })
})
