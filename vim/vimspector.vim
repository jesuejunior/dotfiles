let g:vimspector_enable_mappings = 'HUMAN'

nmap <leader>dd :call vimspector#Launch()<CR>
nmap <leader>dx :call vimspector#Reset()<CR>
nmap <leader>dc :call vimspector#Continue()<CR>
nmap <leader>dp :call vimspector#Pause()<CR>

nmap <leader>db :call vimspector#ToggleBreakpoint()<CR>
nmap <leader>dB :call vimspector#ToggleConditionalBreakpoint()<CR>
nmap <leader>dC :call vimspector#ClearBreakpoints()<CR>

nmap <leader>ds :call vimspector#StepOver()<CR>
nmap <leader>di :call vimspector#StepInto()<CR>
nmap <leader>do :call vimspector#StepOut()<CR>

nmap <leader>dk :call vimspector#UpFrame()<CR>
nmap <leader>dj :call vimspector#DownFrame()<CR>

nmap <leader>de :VimspectorEval<Space>
nmap <leader>dw :VimspectorWatch<Space>
