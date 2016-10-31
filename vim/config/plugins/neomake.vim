augroup my_neomake
  autocmd!
  autocmd BufWritePost,BufReadPost,FileReadPost * Neomake
augroup END
