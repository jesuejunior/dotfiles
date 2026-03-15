# dotfiles

## Vim shortcuts

> `<leader>` is mapped to `Space`

### File & Navigation

mode    | shortcut              | description
--------|-----------------------|-------------------------------------------
NORMAL  | `Ctrl + p`            | FZF — fuzzy find files in project
NORMAL  | `<leader>b`           | FZF — switch between open buffers
NORMAL  | `<leader>rg`          | FZF — ripgrep search across project
NORMAL  | `<leader>/`           | FZF — search lines in current buffer
NORMAL  | `F2`                  | toggle NERDTree panel
NORMAL  | `LF`                  | reveal current file in NERDTree
NORMAL  | `F3`                  | toggle Tagbar panel
NORMAL  | `<leader>a`           | search word under cursor with Ack

### LSP (Language Server)

mode    | shortcut              | description
--------|-----------------------|-------------------------------------------
NORMAL  | `<leader>cd`          | go to definition
NORMAL  | `<leader>/cd`         | go to definition in vertical split
NORMAL  | `<leader>cr`          | find references
NORMAL  | `<leader>ci`          | go to implementation
NORMAL  | `<leader>ct`          | go to type definition
NORMAL  | `<leader>crn`         | rename symbol
NORMAL  | `K`                   | hover documentation
NORMAL  | `[g`                  | previous diagnostic
NORMAL  | `]g`                  | next diagnostic

### ALE (Linting)

mode    | shortcut              | description
--------|-----------------------|-------------------------------------------
NORMAL  | `Ctrl + k`            | jump to previous error/warning
NORMAL  | `Ctrl + j`            | jump to next error/warning
NORMAL  | `<leader>cf`          | find references (ALE)
INSERT  | `Ctrl + Space`        | trigger completion

### Git (Fugitive)

mode    | shortcut              | description
--------|-----------------------|-------------------------------------------
NORMAL  | `<leader>gs`          | git status (fugitive)
NORMAL  | `<leader>gd`          | git diff (vertical split)
NORMAL  | `<leader>gp`          | git push
NORMAL  | `<leader>gP`          | git push --force
NORMAL  | `<leader>gpr`         | git pull --rebase
NORMAL  | `<leader>gDp`         | diffput (accept current change)
NORMAL  | `<leader>gDg`         | diffget (accept incoming change)

### Debugger (Vimspector)

> Requires `:VimspectorInstall CodeLLDB` for Rust.
> Copy the template to your project root: `cp ~/.vim/templates/vimspector-rust.json .vimspector.json`
> then replace `${binaryName}` with your crate name.

mode    | shortcut              | description
--------|-----------------------|-------------------------------------------
NORMAL  | `<leader>dd`          | launch debugger
NORMAL  | `<leader>dx`          | stop / reset debugger
NORMAL  | `<leader>dc`          | continue execution
NORMAL  | `<leader>dp`          | pause execution
NORMAL  | `<leader>db`          | toggle breakpoint
NORMAL  | `<leader>dB`          | toggle conditional breakpoint
NORMAL  | `<leader>dC`          | clear all breakpoints
NORMAL  | `<leader>ds`          | step over
NORMAL  | `<leader>di`          | step into
NORMAL  | `<leader>do`          | step out
NORMAL  | `<leader>dk`          | navigate up in call stack
NORMAL  | `<leader>dj`          | navigate down in call stack
NORMAL  | `<leader>de`          | evaluate expression
NORMAL  | `<leader>dw`          | add watch expression

### Diff mode

mode    | shortcut              | description
--------|-----------------------|-------------------------------------------
ANY     | `F5`                  | diffget LOCAL
ANY     | `F6`                  | diffget BASE
ANY     | `F7`                  | diffget REMOTE

### Testing (vim-test)

mode    | shortcut              | description
--------|-----------------------|-------------------------------------------
NORMAL  | `<leader>tm`          | run nearest test
NORMAL  | `<leader>tf`          | run tests in current file
NORMAL  | `<leader>tp`          | run full test suite

### Terminal

mode    | shortcut              | description
--------|-----------------------|-------------------------------------------
NORMAL  | `<leader>t`           | open terminal in split at bottom
TERMINAL| `Esc`                 | return to previous window

### EasyMotion

mode    | shortcut              | description
--------|-----------------------|-------------------------------------------
NORMAL  | `<leader>mw`          | jump forward by word
NORMAL  | `<leader>mW`          | jump forward by WORD
NORMAL  | `<leader>mb`          | jump backward by word
NORMAL  | `<leader>mB`          | jump backward by WORD
NORMAL  | `<leader>ms`          | jump to 2-char search match

### Editing

mode    | shortcut              | description
--------|-----------------------|-------------------------------------------
NORMAL  | `;`                   | same as `:` (no shift needed)
NORMAL  | `gcc`                 | comment/uncomment current line
VISUAL  | `gc`                  | comment/uncomment selection
VISUAL  | `Tab`                 | indent selection (preserves highlight)
VISUAL  | `Shift + Tab`         | unindent selection (preserves highlight)
VISUAL  | `Ctrl + p`            | duplicate selected block
INSERT  | `Ctrl + e`            | expand UltiSnips snippet
NORMAL  | `Ctrl + s`            | save file (GUI only)

### UI

mode    | shortcut              | description
--------|-----------------------|-------------------------------------------
NORMAL  | `F8`                  | toggle paste mode (disable auto-indent for pasting)
NORMAL  | `F9`                  | toggle dark (Sonokai) / light (PaperColor) theme

### FZF

mode    | shortcut              | description
--------|-----------------------|-------------------------------------------
NORMAL  | `Ctrl + p`            | open FZF file finder
NORMAL  | `<leader>rg`          | search file contents with ripgrep
NORMAL  | `<leader>b`           | search across open buffers
NORMAL  | `<leader>/`           | search lines in current buffer
FZF     | type anything         | fuzzy filter results
FZF     | `Enter`               | open in current window
FZF     | `Ctrl + t`            | open in new tab
FZF     | `Ctrl + v`            | open in vertical split
FZF     | `Ctrl + x`            | open in horizontal split
FZF     | `Ctrl + j / k`        | move down/up in results
FZF     | `Esc`                 | close without opening

### NERDTree

mode      | shortcut              | description
----------|-----------------------|-------------------------------------------
NORMAL    | `F2`                  | toggle NERDTree panel
NORMAL    | `LF`                  | reveal current file in NERDTree
NORMAL    | `Ctrl + w h`          | move focus into NERDTree (left)
NORMAL    | `Ctrl + w l`          | move focus out of NERDTree (right)
NORMAL    | `Ctrl + w w`          | toggle focus between NERDTree and file
NERDTREE  | `Enter`               | open file / expand folder
NERDTREE  | `o`                   | open file in horizontal split
NERDTREE  | `v`                   | open file in vertical split
NERDTREE  | `t`                   | open file in new tab
NERDTREE  | `m`                   | open menu (create, rename, delete)
NERDTREE  | `R`                   | refresh tree
NERDTREE  | `q`                   | close NERDTree

### Tabs

mode    | shortcut              | description
--------|-----------------------|-------------------------------------------
ANY     | `Ctrl + l`            | next tab
ANY     | `Ctrl + h`            | previous tab
ANY     | `Ctrl + n`            | new tab
NORMAL  | `gt`                  | next tab (vim native)
NORMAL  | `gT`                  | previous tab (vim native)
NORMAL  | `2gt`                 | jump to tab number 2
NORMAL  | `:tabnew filename`    | open file in new tab
NORMAL  | `:tabclose`           | close current tab
NORMAL  | `:tabonly`            | close all other tabs
FZF     | `Ctrl + t`            | open FZF result in a new tab

### Splits

mode    | shortcut              | description
--------|-----------------------|-------------------------------------------
NORMAL  | `:sp filename`        | horizontal split (file below)
NORMAL  | `:vsp filename`       | vertical split (file on right)
NORMAL  | `Ctrl + w h`          | move to split on the left
NORMAL  | `Ctrl + w l`          | move to split on the right
NORMAL  | `Ctrl + w j`          | move to split below
NORMAL  | `Ctrl + w k`          | move to split above
NORMAL  | `Ctrl + w w`          | cycle through splits
NORMAL  | `Ctrl + w =`          | equalize all split sizes
NORMAL  | `Ctrl + w +`          | increase split height
NORMAL  | `Ctrl + w -`          | decrease split height
NORMAL  | `Ctrl + w >`          | increase split width
NORMAL  | `Ctrl + w <`          | decrease split width
NORMAL  | `Ctrl + w o`          | close all other splits
NORMAL  | `<leader>/cd`         | open LSP definition in vertical split
NORMAL  | `<leader>-cd`         | open LSP definition in horizontal split
NORMAL  | `<leader>gd`          | open git diff in vertical split
FZF     | `Ctrl + v`            | open FZF result in vertical split
FZF     | `Ctrl + x`            | open FZF result in horizontal split

---

## Vim reference

### Cursor movement

key     | action
--------|-------
`h`     | left
`j`     | down
`k`     | up
`l`     | right
`w`     | jump to start of next word
`W`     | jump to start of next WORD
`e`     | jump to end of word
`b`     | jump to start of previous word
`0`     | start of line
`^`     | first non-blank character
`$`     | end of line
`G`     | last line
`5G`    | go to line 5
`''`    | position before last jump

### Insert mode

key     | action
--------|-------
`i`     | insert before cursor
`I`     | insert at beginning of line
`a`     | insert after cursor
`A`     | insert at end of line
`o`     | new line below
`O`     | new line above
`ea`    | insert at end of word
`Esc`   | exit insert mode

### Editing

key     | action
--------|-------
`r`     | replace single character
`J`     | join line below
`cc`    | replace entire line
`cw`    | replace to end of word
`c$`    | replace to end of line
`s`     | delete character and substitute
`u`     | undo
`Ctrl+r`| redo
`.`     | repeat last command

### Visual mode

key         | action
------------|-------
`v`         | start visual mode
`V`         | linewise visual mode
`Ctrl + v`  | visual block mode
`aw`        | select word
`ab`        | select block with `()`
`aB`        | select block with `{}`
`>`         | indent
`<`         | unindent
`y`         | yank
`d`         | delete
`~`         | switch case

### Cut & paste

key     | action
--------|-------
`yy`    | yank line
`yw`    | yank word
`y$`    | yank to end of line
`p`     | paste after cursor
`P`     | paste before cursor
`dd`    | delete line
`dw`    | delete word
`D`     | delete to end of line
`x`     | delete character

### Search & replace

command             | action
--------------------|-------
`*`                 | search word under cursor
`/pattern`          | search forward
`?pattern`          | search backward
`n`                 | repeat search forward
`N`                 | repeat search backward
`:%s/old/new/g`     | replace all in file
`:%s/old/new/gc`    | replace all with confirmation

### Exiting

command | action
--------|-------
`:w`    | save
`:wq`   | save and quit
`:q`    | quit (fails if unsaved)
`:q!`   | quit discarding changes
