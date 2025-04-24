-- default detection doesnt work on new files
vim.filetype.add({
  extension = {
    tf = 'terraform',
  },
})

vim.lsp.enable('terraformls')
vim.lsp.enable('tflint')
