let g:ale_close_preview_on_insert = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 0
let g:ale_fix_on_save = 1

let g:ale_fixers = {
\   '*':          ['remove_trailing_lines', 'trim_whitespace'],
\   'python':     ['black', 'isort'],
\   'rust':       ['rustfmt'],
\   'sql':        ['pgformatter'],
\   'javascript': ['eslint'],
\}

let g:ale_linters = {
\   'python': ['ruff', 'mypy', 'pylsp'],
\   'rust':   ['cargo', 'rustc'],
\   'sql':    ['sqlfluff'],
\   'zsh':    ['shell'],
\}

" Python options
let g:ale_python_black_options        = '--line-length 120'
let g:ale_python_isort_options        = '--apply --recursive --line-width 120 --use-parentheses --no-inline-sort --multi-line 3 --trailing-comma'
let g:ale_python_mypy_options         = '--ignore-missing-imports --no-incremental'
let g:ale_python_mypy_auto_pipenv     = 1
let g:ale_python_ruff_options         = '--line-length 120'

" Rust options
let g:ale_rust_rustfmt_options        = '--edition 2024'
let g:ale_rust_cargo_use_clippy       = 1

" SQL options (sqlfluff dialect — change to 'bigquery' if preferred)
let g:ale_sql_sqlfluff_options        = '--dialect postgres'

" UI
let g:ale_set_balloon                 = 1
let g:ale_set_highlights              = 0
let g:ale_completion_enabled          = 1
let g:ale_completion_delay            = 200

set completeopt=menu,menuone,preview,noselect,noinsert
