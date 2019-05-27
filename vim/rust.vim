"""RUST
set hidden
let g:racer_cmd = "/Users/jesuejunior/.cargo/bin/racer"
let g:racer_experimental_completer = 1
au FileType rust nmap grd <Plug>(rust-def)
au FileType rust nmap grs <Plug>(rust-def-split)
au FileType rust nmap grx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>grd <Plug>(rust-doc)