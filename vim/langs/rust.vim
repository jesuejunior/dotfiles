" rust-analyzer is auto-discovered by vim-lsp-settings.
" Run :LspInstallServer inside a .rs file to install it.
" Manual registration kept here as fallback.
if executable('rust-analyzer')
  au User lsp_setup call lsp#register_server({
        \ 'name': 'rust-analyzer',
        \ 'cmd': {server_info->['rust-analyzer']},
        \ 'allowlist': ['rust'],
        \ })
endif
