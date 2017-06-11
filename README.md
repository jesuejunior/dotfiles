Innitial DOCS


### shortcuts

mode    | shortcut              | description
--------|-----------------------|-------------------------------------------
NORMAL  | ;                     | the same as the colon key, so that you don't need to use SHIFT C (pressckly) |
NORMAL  | gcc                   | comment the current line of code |
NORMAL  | F2                    | toggle the NERDTree panel (directories and files) |
NORMAL  | F3                    | toggle the TagBar panel |
NORMAL  | F7                    | invoke the Flake8 (Python code verification) |
NORMAL  | ,,w                   | activate the EasyMotion (try press the H command first) |
NORMAL  | CTRL + P              | activate the CtrlP plugin; press ENTER to open the file(s) in a new tab |
INSERT  | Ctrl + e              | html code templates with Sparkup (must be editing a HTML file) |
NORMAL  | TAB                   | indent preserving visual selection |
NORMAL  | SHIFT + TAB           | unindent preserving visual selection |
ANY     | CTRL + right arrow    | go to the next tab |
ANY     | CTRL + left arrow     | go to the previuos tab |
ANY     | CTRL + h              | set the focus on the left window |
ANY     | CTRL + l              | set the focus on the right window |
ANY     | CTRL + j              | set the focus on the window below |
ANY     | CTRL + k              | set the focus on the window above |
NORMAL  | LF                    | locate the file in the NERDTree panel | 
VISUAL  | Ctrl + P              | duplicate the selected block of code |

### Vim shortcuts


Key | Cursor movement
----------------|------------------
h |	move cursor left |
j |	move cursor down |
k |	move cursor up |
l |	move cursor right |
w | 	jump forwards to the start of a word |
W |	jump forwards to the start of a word (words can contain punctuation) |
e |	jump forwards to the end of a word |
E |	jump forwards to the end of a word (words can contain punctuation) |
b |	jump backwards to the start of a word |
B |	jump backwards to the start of a word (words can contain punctuation) |
0 |	jump to the start of the line |
^ |	jump to the first non-blank character of the line |
$ |	jump to the end of the line |
G |	go to the last line of the document |
5G |	go to line 5 |
'' |	To the position before the latest jump, / where the last "m'" / "m`" command was given. |


Key | Insert mode - inserting/appending text
----|----------------------------------------
i |	insert before the cursor | 
I |	insert at the beginning of the line |
a |	insert (append) after the cursor |
A |	insert (append) at the end of the line |
o |	append (open) a new line below the current line |
O |	append (open) a new line above the current line |
ea |	insert (append) at the end of the word |
Esc |	exit insert mode |

Key| Editing
---|-----------
r |	replace a single character | 
J |	join line below to the current one | 
cc |	change (replace) entire line | 
cw |	change (replace) to the end of the word | 
c$ |	change (replace) to the end of the line | 
s |	delete character and substitute text |
S |	delete line and substitute text (same as cc) |
xp |	transpose two letters (delete and paste) |
u |	undo |
Ctrl + r |	redo |
. |	repeat last command |


Key | Marking text (visual mode)
----|----------------------------
v |	start visual mode, mark lines, then do a command (like y-yank) |
V |	start linewise visual mode |
o |	move to other end of marked area |
Ctrl + v |	start visual block mode |
O |	move to other corner of block |
aw |	mark a word |
ab |	a block with () |
aB |	a block with {} |
ib |	inner block with () |
iB |	inner block with {} |
Esc |	exit visual mode |

Key | Visual commands
----|----------------
> |	shift text right |
< |	shift text left |
y |	yank (copy) marked text |
d |	delete marked text |
~ |	switch case |

Key | Cut and paste
----|--------------
yy |	yank (copy) a line |
2yy |	yank (copy) 2 lines |
yw |	yank (copy) word |
y$ |	yank (copy) to end of line |
p |	put (paste) the clipboard after cursor |
P |	put (paste) before cursor |
dd |	delete (cut) a line |
2dd |	delete (cut) 2 lines |
dw |	delete (cut) word |
D |	delete (cut) to the end of the line |
d$ |	delete (cut) to the end of the line |
x |	delete (cut) character |

Key | Exiting
----|--------
:w |	write (save) the file, but don't exit |
:wq |	write (save) and quit |
:x |	write (save) and quit |
:q |	quit (fails if there are unsaved changes) |
:q! |	quit and throw away unsaved changes |

Command | Search and replace
--------|-------------------
\* |	search for word under cursor |
/pattern |	search for pattern |
?pattern |	search backward for pattern |
n |	repeat search in same direction |
N |	repeat search in opposite direction |
:%s/old/new/g |	replace all old with new throughout file |
:%s/old/new/gc |	replace all old with new throughout file with confirmations |

Command | Tabs
--------|-----
Ctrl + l |	move to the next tab |
Ctrl + h |	move to the previous tab |
