## Verb c Change
1) cw     - change to next word
2) cc     - change entire line
3) ce     - change from cursor to end of word
4) c$     - change to end of line
5) ci"    - change inside of double quotes
6) ca"    - change around double quotes
7) cfx    - change until next found occurrence of letter x(search forward)
8) cFx    - change until next found occurrence of letter x(search backward)
9) cis    - change inside sentence
10) ci}   - change inside block
11) cip   - change inside paragraph
12) c/foo - change until next occurence of 'foo'

Verb v - Visual
1) vap - select paragraph
2) V   - select line
3) vfx - select until next found occurence of letter x(search forward)
3) vFx - select until next found occurence of letter x(search backward)

## CTRL

1) v visual block mode
2) w window adjustments
3) r redo
4) b back one full screen
5) f forward one full screen
6) d forward half screen
7) u back half screen
8) [ built in <esc> mapping

## Window Navigation

1) Ctrl-w j   Move to down window
2) Ctrl-w k   Move to up window
3) Ctrl-w h   Move to left window
4) Ctrl-w l   Move to right window
5) Ctrl-w R   Swap top/bottom or left/right split
6) Ctrl-w T   Break out current window into a new tabview
7) Ctrl-w o   Close every window in the current tabview but the current one

## Window Resize

1) Ctrl-w =   To resize all windows to equal dimensions based on their splits
2) Ctrl-w -   To decrease a window by one row
3) Ctrl-w +   To increase a window by one row
4) Ctrl-w _   To increase a window to its maximum height
5) Ctrl-w |   To incsearch a window to its maximum width
6) Ctrl-w >   To increase a window by one column
7) Ctrl-w <   To decrease a window by one column
8) Ctrl-w o   Make the current window the only one on the screen.
20<C-w>|     Set window width to 20 columns
10<C-w>>     Increase window width by 10 columns
10<C-w><     Decrease window width by 10 columns
10<C-w>+     Increase window height by 10 columns
10<C-w>-     Decrease window height by 10 columns

## Window Split

1) Ctrl-w s   Split
2) Ctrl-w v   Vsplit

## Folding

zc — close the fold (where your cursor is positioned)
zM — close all folds on current buffer
zo — open the fold (where your cursor is positioned)
zR — open all folds on current buffer
zj — cursor is moved to next fold
zk — cursor is moved to previous fold

## Change case

1) ~     change the case of current character
2) guu   change current line from upper to lower
3) gUU   change current LINE from lower to upper
4) guw   change to end of current WORD from upper to lower
5) guaw  change all of current WORD to lower
6) gUw   change to end of current WORD from lower to upper
7) gUaw  change all of current WORD to upper
8) g~~   Invert case to entire line

## New lines
use [<Space> and ]<Space> provided by unimpaired

 gn/gN (n is forward, N is backward)
 run '/foo' to search the word 'foo', then type 'cgn', type the contents of
 replacement, then <Esc>, now press 'n.' to repeat the change for each
 subsequent match.
