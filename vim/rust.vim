""" Rust
" rust-analyzer is auto-installed by vim-lsp-settings (:LspInstallServer)
" Key bindings reuse the same <leader>c namespace as other LSP buffers (vimlsp.vim)

" rustfmt on save
autocmd FileType rust let b:ale_fix_on_save = 1
