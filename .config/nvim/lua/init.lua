vim.lsp.start({
    name = 'clangd for c',
    cmd = {'clangd'},
    root_dir = vim.fs.dirname(vim.fs.find({'Makefile'},{ upward = true})[1]),
})
