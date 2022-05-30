local _ = [==[
[
{
  "tag": "i_CTRL-@",
  "char": "CTRL-@",
  "mode": "i",
  "summary": "insert previously inserted text and stop insert"
},
{
  "tag": "i_CTRL-A",
  "char": "CTRL-A",
  "mode": "i",
  "summary": "insert previously inserted text"
},
{
  "tag": "i_CTRL-C",
  "char": "CTRL-C",
  "mode": "i",
  "summary": "quit insert mode, without checking for abbreviation"
},
{
  "tag": "i_CTRL-D",
  "char": "CTRL-D",
  "mode": "i",
  "summary": "delete one shiftwidth of indent in the current line"
},
{
  "tag": "i_CTRL-E",
  "char": "CTRL-E",
  "mode": "i",
  "summary": "insert the character which is below the cursor"
},
{
  "tag": "<NONE>",
  "char": "CTRL-F",
  "mode": "i",
  "summary": "not used (but by default it's in 'cinkeys' to re-indent the current line)"
},
{
  "tag": "i_CTRL-G_j",
  "char": "CTRL-G CTRL-J",
  "mode": "i",
  "summary": "line down, to column where inserting started"
},
{
  "tag": "i_CTRL-G_j",
  "char": "CTRL-G j",
  "mode": "i",
  "summary": "line down, to column where inserting started"
},
{
  "tag": "i_CTRL-G_j",
  "char": "CTRL-G <Down>",
  "mode": "i",
  "summary": "line down, to column where inserting started"
},
{
  "tag": "i_CTRL-G_k",
  "char": "CTRL-G CTRL-K",
  "mode": "i",
  "summary": "line up, to column where inserting started"
},
{
  "tag": "i_CTRL-G_k",
  "char": "CTRL-G k",
  "mode": "i",
  "summary": "line up, to column where inserting started"
},
{
  "tag": "i_CTRL-G_k",
  "char": "CTRL-G <Up>",
  "mode": "i",
  "summary": "line up, to column where inserting started"
},
{
  "tag": "i_CTRL-G_u",
  "char": "CTRL-G u",
  "mode": "i",
  "summary": "start new undoable edit"
},
{
  "tag": "i_CTRL-G_U",
  "char": "CTRL-G U",
  "mode": "i",
  "summary": "don't break undo with next cursor movement"
},
{
  "tag": "i_<BS>",
  "char": "<BS>",
  "mode": "i",
  "summary": "delete character before the cursor"
},
{
  "tag": "i_digraph",
  "char": "{char1}<BS>{char2}",
  "mode": "i",
  "summary": "enter digraph (only when 'digraph' option set)"
},
{
  "tag": "i_CTRL-H",
  "char": "CTRL-H",
  "mode": "i",
  "summary": "same as <BS>"
},
{
  "tag": "i_<Tab>",
  "char": "<Tab>",
  "mode": "i",
  "summary": "insert a <Tab> character"
},
{
  "tag": "i_CTRL-I",
  "char": "CTRL-I",
  "mode": "i",
  "summary": "same as <Tab>"
},
{
  "tag": "i_<NL>",
  "char": "<NL>",
  "mode": "i",
  "summary": "same as <CR>"
},
{
  "tag": "i_CTRL-J",
  "char": "CTRL-J",
  "mode": "i",
  "summary": "same as <CR>"
},
{
  "tag": "i_CTRL-K",
  "char": "CTRL-K {char1} {char2}",
  "mode": "i",
  "summary": "enter digraph"
},
{
  "tag": "i_<CR>",
  "char": "<CR>",
  "mode": "i",
  "summary": "begin new line"
},
{
  "tag": "i_CTRL-M",
  "char": "CTRL-M",
  "mode": "i",
  "summary": "same as <CR>"
},
{
  "tag": "i_CTRL-N",
  "char": "CTRL-N",
  "mode": "i",
  "summary": "find next match for keyword in front of the cursor"
},
{
  "tag": "i_CTRL-O",
  "char": "CTRL-O",
  "mode": "i",
  "summary": "execute a single command and return to insert mode"
},
{
  "tag": "i_CTRL-P",
  "char": "CTRL-P",
  "mode": "i",
  "summary": "find previous match for keyword in front of the cursor"
},
{
  "tag": "i_CTRL-Q",
  "char": "CTRL-Q",
  "mode": "i",
  "summary": "same as CTRL-V, unless used for terminal control flow"
},
{
  "tag": "i_CTRL-SHIFT-Q",
  "char": "CTRL-SHIFT-Q {char}",
  "mode": "i",
  "summary": "like CTRL-Q unless |modifyOtherKeys| is active"
},
{
  "tag": "i_CTRL-R",
  "char": "CTRL-R {register}",
  "mode": "i",
  "summary": "insert the contents of a register"
},
{
  "tag": "i_CTRL-R_CTRL-R",
  "char": "CTRL-R CTRL-R {register}",
  "mode": "i",
  "summary": "insert the contents of a register literally"
},
{
  "tag": "i_CTRL-R_CTRL-O",
  "char": "CTRL-R CTRL-O {register}",
  "mode": "i",
  "summary": "insert the contents of a register literally and don't auto-indent"
},
{
  "tag": "i_CTRL-R_CTRL-P",
  "char": "CTRL-R CTRL-P {register}",
  "mode": "i",
  "summary": "insert the contents of a register literally and fix indent."
},
{
  "tag": "<NONE>",
  "char": "CTRL-S",
  "mode": "i",
  "summary": "not used or used for terminal control flow"
},
{
  "tag": "i_CTRL-T",
  "char": "CTRL-T",
  "mode": "i",
  "summary": "insert one shiftwidth of indent in current line"
},
{
  "tag": "i_CTRL-U",
  "char": "CTRL-U",
  "mode": "i",
  "summary": "delete all entered characters in the current line"
},
{
  "tag": "i_CTRL-V",
  "char": "CTRL-V {char}",
  "mode": "i",
  "summary": "insert next non-digit literally"
},
{
  "tag": "i_CTRL-SHIFT-V",
  "char": "CTRL-SHIFT-V {char}",
  "mode": "i",
  "summary": "like CTRL-V unless |modifyOtherKeys| is active"
},
{
  "tag": "i_CTRL-V_digit",
  "char": "CTRL-V {number}",
  "mode": "i",
  "summary": "insert three digit decimal number as a single byte."
},
{
  "tag": "i_CTRL-W",
  "char": "CTRL-W",
  "mode": "i",
  "summary": "delete word before the cursor"
},
{
  "tag": "i_CTRL-X",
  "char": "CTRL-X {mode}",
  "mode": "i",
  "summary": "enter CTRL-X sub mode, see |i_CTRL-X_index|"
},
{
  "tag": "i_CTRL-Y",
  "char": "CTRL-Y",
  "mode": "i",
  "summary": "insert the character which is above the cursor"
},
{
  "tag": "i_<Esc>",
  "char": "<Esc>",
  "mode": "i",
  "summary": "end insert mode"
},
{
  "tag": "i_CTRL-[",
  "char": "CTRL-[",
  "mode": "i",
  "summary": "same as <Esc>"
},
{
  "tag": "i_CTRL-\\_CTRL-N",
  "char": "CTRL-\\ CTRL-N",
  "mode": "i",
  "summary": "go to Normal mode"
},
{
  "tag": "i_CTRL-\\_CTRL-G",
  "char": "CTRL-\\ CTRL-G",
  "mode": "i",
  "summary": "go to Normal mode"
},
{
  "tag": "<NONE>",
  "char": "CTRL-\\ a - z",
  "mode": "i",
  "summary": "reserved for extensions"
},
{
  "tag": "<NONE>",
  "char": "CTRL-\\ others",
  "mode": "i",
  "summary": "not used"
},
{
  "tag": "i_CTRL-]",
  "char": "CTRL-]",
  "mode": "i",
  "summary": "trigger abbreviation"
},
{
  "tag": "i_CTRL-^",
  "char": "CTRL-^",
  "mode": "i",
  "summary": "toggle use of |:lmap| mappings"
},
{
  "tag": "i_CTRL-_",
  "char": "CTRL-_",
  "mode": "i",
  "summary": "When 'allowrevins' set: change language (Hebrew)"
},
{
  "tag": "<NONE>",
  "char": "<Space> to '~'",
  "mode": "i",
  "summary": "not used, except '0' and '^' followed by CTRL-D"
},
{
  "tag": "i_0_CTRL-D",
  "char": "0 CTRL-D",
  "mode": "i",
  "summary": "delete all indent in the current line"
},
{
  "tag": "i_^_CTRL-D",
  "char": "^ CTRL-D",
  "mode": "i",
  "summary": "delete all indent in the current line, restore it in the next line"
},
{
  "tag": "i_<Del>",
  "char": "<Del>",
  "mode": "i",
  "summary": "delete character under the cursor"
},
{
  "tag": "i_<Left>",
  "char": "<Left>",
  "mode": "i",
  "summary": "cursor one character left"
},
{
  "tag": "i_<S-Left>",
  "char": "<S-Left>",
  "mode": "i",
  "summary": "cursor one word left"
},
{
  "tag": "i_<C-Left>",
  "char": "<C-Left>",
  "mode": "i",
  "summary": "cursor one word left"
},
{
  "tag": "i_<Right>",
  "char": "<Right>",
  "mode": "i",
  "summary": "cursor one character right"
},
{
  "tag": "i_<S-Right>",
  "char": "<S-Right>",
  "mode": "i",
  "summary": "cursor one word right"
},
{
  "tag": "i_<C-Right>",
  "char": "<C-Right>",
  "mode": "i",
  "summary": "cursor one word right"
},
{
  "tag": "i_<Up>",
  "char": "<Up>",
  "mode": "i",
  "summary": "cursor one line up"
},
{
  "tag": "i_<S-Up>",
  "char": "<S-Up>",
  "mode": "i",
  "summary": "same as <PageUp>"
},
{
  "tag": "i_<Down>",
  "char": "<Down>",
  "mode": "i",
  "summary": "cursor one line down"
},
{
  "tag": "i_<S-Down>",
  "char": "<S-Down>",
  "mode": "i",
  "summary": "same as <PageDown>"
},
{
  "tag": "i_<Home>",
  "char": "<Home>",
  "mode": "i",
  "summary": "cursor to start of line"
},
{
  "tag": "i_<C-Home>",
  "char": "<C-Home>",
  "mode": "i",
  "summary": "cursor to start of file"
},
{
  "tag": "i_<End>",
  "char": "<End>",
  "mode": "i",
  "summary": "cursor past end of line"
},
{
  "tag": "i_<C-End>",
  "char": "<C-End>",
  "mode": "i",
  "summary": "cursor past end of file"
},
{
  "tag": "i_<PageUp>",
  "char": "<PageUp>",
  "mode": "i",
  "summary": "one screenful backward"
},
{
  "tag": "i_<PageDown>",
  "char": "<PageDown>",
  "mode": "i",
  "summary": "one screenful forward"
},
{
  "tag": "i_<F1>",
  "char": "<F1>",
  "mode": "i",
  "summary": "same as <Help>"
},
{
  "tag": "i_<Help>",
  "char": "<Help>",
  "mode": "i",
  "summary": "stop insert mode and display help window"
},
{
  "tag": "i_<Insert>",
  "char": "<Insert>",
  "mode": "i",
  "summary": "toggle Insert/Replace mode"
},
{
  "tag": "i_<LeftMouse>",
  "char": "<LeftMouse>",
  "mode": "i",
  "summary": "cursor at mouse click"
},
{
  "tag": "i_<ScrollWheelDown>",
  "char": "<ScrollWheelDown>",
  "mode": "i",
  "summary": "move window three lines down"
},
{
  "tag": "i_<S-ScrollWheelDown>",
  "char": "<S-ScrollWheelDown>",
  "mode": "i",
  "summary": "move window one page down"
},
{
  "tag": "i_<ScrollWheelUp>",
  "char": "<ScrollWheelUp>",
  "mode": "i",
  "summary": "move window three lines up"
},
{
  "tag": "i_<S-ScrollWheelUp>",
  "char": "<S-ScrollWheelUp>",
  "mode": "i",
  "summary": "move window one page up"
},
{
  "tag": "i_<ScrollWheelLeft>",
  "char": "<ScrollWheelLeft>",
  "mode": "i",
  "summary": "move window six columns left"
},
{
  "tag": "i_<S-ScrollWheelLeft>",
  "char": "<S-ScrollWheelLeft>",
  "mode": "i",
  "summary": "move window one page left"
},
{
  "tag": "i_<ScrollWheelRight>",
  "char": "<ScrollWheelRight>",
  "mode": "i",
  "summary": "move window six columns right"
},
{
  "tag": "i_<S-ScrollWheelRight>",
  "char": "<S-ScrollWheelRight>",
  "mode": "i",
  "summary": "move window one page right"
},
{
  "tag": "i_CTRL-X_CTRL-D",
  "char": "CTRL-X CTRL-D",
  "mode": "i",
  "summary": "complete defined identifiers"
},
{
  "tag": "i_CTRL-X_CTRL-E",
  "char": "CTRL-X CTRL-E",
  "mode": "i",
  "summary": "scroll up"
},
{
  "tag": "i_CTRL-X_CTRL-F",
  "char": "CTRL-X CTRL-F",
  "mode": "i",
  "summary": "complete file names"
},
{
  "tag": "i_CTRL-X_CTRL-I",
  "char": "CTRL-X CTRL-I",
  "mode": "i",
  "summary": "complete identifiers"
},
{
  "tag": "i_CTRL-X_CTRL-K",
  "char": "CTRL-X CTRL-K",
  "mode": "i",
  "summary": "complete identifiers from dictionary"
},
{
  "tag": "i_CTRL-X_CTRL-L",
  "char": "CTRL-X CTRL-L",
  "mode": "i",
  "summary": "complete whole lines"
},
{
  "tag": "i_CTRL-X_CTRL-N",
  "char": "CTRL-X CTRL-N",
  "mode": "i",
  "summary": "next completion"
},
{
  "tag": "i_CTRL-X_CTRL-O",
  "char": "CTRL-X CTRL-O",
  "mode": "i",
  "summary": "omni completion"
},
{
  "tag": "i_CTRL-X_CTRL-P",
  "char": "CTRL-X CTRL-P",
  "mode": "i",
  "summary": "previous completion"
},
{
  "tag": "i_CTRL-X_CTRL-S",
  "char": "CTRL-X CTRL-S",
  "mode": "i",
  "summary": "spelling suggestions"
},
{
  "tag": "i_CTRL-X_CTRL-T",
  "char": "CTRL-X CTRL-T",
  "mode": "i",
  "summary": "complete identifiers from thesaurus"
},
{
  "tag": "i_CTRL-X_CTRL-Y",
  "char": "CTRL-X CTRL-Y",
  "mode": "i",
  "summary": "scroll down"
},
{
  "tag": "i_CTRL-X_CTRL-U",
  "char": "CTRL-X CTRL-U",
  "mode": "i",
  "summary": "complete with 'completefunc'"
},
{
  "tag": "i_CTRL-X_CTRL-V",
  "char": "CTRL-X CTRL-V",
  "mode": "i",
  "summary": "complete like in : command line"
},
{
  "tag": "i_CTRL-X_CTRL-Z",
  "char": "CTRL-X CTRL-Z",
  "mode": "i",
  "summary": "stop completion, keeping the text as-is"
},
{
  "tag": "i_CTRL-X_CTRL-]",
  "char": "CTRL-X CTRL-]",
  "mode": "i",
  "summary": "complete tags"
},
{
  "tag": "i_CTRL-X_s",
  "char": "CTRL-X s",
  "mode": "i",
  "summary": "spelling suggestions"
},
{
  "tag": "<NONE>",
  "char": "CTRL-@",
  "summary": "not used",
  "mode": "n"
},
{
  "tag": "CTRL-A",
  "char": "CTRL-A",
  "note": "2",
  "summary": "add N to number at/after cursor",
  "mode": "n"
},
{
  "tag": "CTRL-B",
  "char": "CTRL-B",
  "note": "1",
  "summary": "scroll N screens Backwards",
  "mode": "n"
},
{
  "tag": "CTRL-C",
  "char": "CTRL-C",
  "summary": "interrupt current (search) command",
  "mode": "n"
},
{
  "tag": "CTRL-D",
  "char": "CTRL-D",
  "summary": "scroll Down N lines (default: half a screen)",
  "mode": "n"
},
{
  "tag": "CTRL-E",
  "char": "CTRL-E",
  "summary": "scroll N lines upwards (N lines Extra)",
  "mode": "n"
},
{
  "tag": "CTRL-F",
  "char": "CTRL-F",
  "note": "1",
  "summary": "scroll N screens Forward",
  "mode": "n"
},
{
  "tag": "CTRL-G",
  "char": "CTRL-G",
  "summary": "display current file name and position",
  "mode": "n"
},
{
  "tag": "<BS>",
  "char": "<BS>",
  "note": "1",
  "summary": "same as 'h'",
  "mode": "n"
},
{
  "tag": "CTRL-H",
  "char": "CTRL-H",
  "note": "1",
  "summary": "same as 'h'",
  "mode": "n"
},
{
  "tag": "<Tab>",
  "char": "<Tab>",
  "note": "1",
  "summary": "go to N newer entry in jump list",
  "mode": "n"
},
{
  "tag": "CTRL-I",
  "char": "CTRL-I",
  "note": "1",
  "summary": "same as <Tab>",
  "mode": "n"
},
{
  "tag": "<NL>",
  "char": "<NL>",
  "note": "1",
  "summary": "same as 'j'",
  "mode": "n"
},
{
  "tag": "CTRL-J",
  "char": "CTRL-J",
  "note": "1",
  "summary": "same as 'j'",
  "mode": "n"
},
{
  "tag": "<NONE>",
  "char": "CTRL-K",
  "summary": "not used",
  "mode": "n"
},
{
  "tag": "CTRL-L",
  "char": "CTRL-L",
  "summary": "redraw screen",
  "mode": "n"
},
{
  "tag": "<CR>",
  "char": "<CR>",
  "note": "1",
  "summary": "cursor to the first CHAR N lines lower",
  "mode": "n"
},
{
  "tag": "CTRL-M",
  "char": "CTRL-M",
  "note": "1",
  "summary": "same as <CR>",
  "mode": "n"
},
{
  "tag": "CTRL-N",
  "char": "CTRL-N",
  "note": "1",
  "summary": "same as 'j'",
  "mode": "n"
},
{
  "tag": "CTRL-O",
  "char": "CTRL-O",
  "note": "1",
  "summary": "go to N older entry in jump list",
  "mode": "n"
},
{
  "tag": "CTRL-P",
  "char": "CTRL-P",
  "note": "1",
  "summary": "same as 'k'",
  "mode": "n"
},
{
  "tag": "<NONE>",
  "char": "CTRL-Q",
  "summary": "not used, or used for terminal control flow",
  "mode": "n"
},
{
  "tag": "CTRL-R",
  "char": "CTRL-R",
  "note": "2",
  "summary": "redo changes which were undone with 'u'",
  "mode": "n"
},
{
  "tag": "<NONE>",
  "char": "CTRL-S",
  "summary": "not used, or used for terminal control flow",
  "mode": "n"
},
{
  "tag": "CTRL-T",
  "char": "CTRL-T",
  "summary": "jump to N older Tag in tag list",
  "mode": "n"
},
{
  "tag": "CTRL-U",
  "char": "CTRL-U",
  "summary": "scroll N lines Upwards (default: half a screen)",
  "mode": "n"
},
{
  "tag": "CTRL-V",
  "char": "CTRL-V",
  "summary": "start blockwise Visual mode",
  "mode": "n"
},
{
  "tag": "CTRL-W",
  "char": "CTRL-W {char}",
  "summary": "window commands, see |CTRL-W|",
  "mode": "n"
},
{
  "tag": "CTRL-X",
  "char": "CTRL-X",
  "note": "2",
  "summary": "subtract N from number at/after cursor",
  "mode": "n"
},
{
  "tag": "CTRL-Y",
  "char": "CTRL-Y",
  "summary": "scroll N lines downwards",
  "mode": "n"
},
{
  "tag": "CTRL-Z",
  "char": "CTRL-Z",
  "summary": "suspend program (or start new shell)",
  "mode": "n"
},
{
  "tag": "<NONE>",
  "char": "CTRL-[ <Esc>",
  "summary": "not used",
  "mode": "n"
},
{
  "tag": "CTRL-\\_CTRL-N",
  "char": "CTRL-\\ CTRL-N",
  "summary": "go to Normal mode (no-op)",
  "mode": "n"
},
{
  "tag": "CTRL-\\_CTRL-G",
  "char": "CTRL-\\ CTRL-G",
  "summary": "go to Normal mode (no-op)",
  "mode": "n"
},
{
  "tag": "<NONE>",
  "char": "CTRL-\\ a - z",
  "summary": "reserved for extensions",
  "mode": "n"
},
{
  "tag": "<NONE>",
  "char": "CTRL-\\ others",
  "summary": "not used",
  "mode": "n"
},
{
  "tag": "CTRL-]",
  "char": "CTRL-]",
  "summary": ":ta to ident under cursor",
  "mode": "n"
},
{
  "tag": "CTRL-^",
  "char": "CTRL-^",
  "summary": "edit Nth alternate file (equivalent to ':e #N')",
  "mode": "n"
},
{
  "tag": "CTRL-<Tab>",
  "char": "CTRL-<Tab>",
  "summary": "same as `g<Tab>` : go to last accessed tab page",
  "mode": "n"
},
{
  "tag": "<NONE>",
  "char": "CTRL-_",
  "summary": "not used",
  "mode": "n"
},
{
  "tag": "<Space>",
  "char": "<Space>",
  "note": "1",
  "summary": "same as 'l'",
  "mode": "n"
},
{
  "tag": "!",
  "char": "!{motion}{filter}",
  "note": "2",
  "summary": "filter Nmove text through the {filter} command",
  "mode": "n"
},
{
  "tag": "!!",
  "char": "!!{filter}",
  "note": "2",
  "summary": "filter N lines through the {filter} command",
  "mode": "n"
},
{
  "tag": "quote",
  "char": "\"{register}  ",
  "summary": "use {register} for next delete, yank or put ({.%#:} only work with put)",
  "mode": "n"
},
{
  "tag": "#",
  "char": "#",
  "note": "1",
  "summary": "search backward for the Nth occurrence of the ident under the cursor",
  "mode": "n"
},
{
  "tag": "$",
  "char": "$",
  "note": "1",
  "summary": "cursor to the end of Nth next line",
  "mode": "n"
},
{
  "tag": "%",
  "char": "%",
  "note": "1",
  "summary": "find the next (curly/square) bracket on this line and go to its match, or go to matching comment bracket, or go to matching preprocessor directive.",
  "mode": "n"
},
{
  "tag": "N%",
  "char": "{count}%",
  "note": "1",
  "summary": "go to N percentage in the file",
  "mode": "n"
},
{
  "tag": "&",
  "char": "&",
  "note": "2",
  "summary": "repeat last :s",
  "mode": "n"
},
{
  "tag": "'",
  "char": "'{a-zA-Z0-9}",
  "note": "1",
  "summary": "cursor to the first CHAR on the line with mark {a-zA-Z0-9}",
  "mode": "n"
},
{
  "tag": "''",
  "char": "''",
  "note": "1",
  "summary": "cursor to the first CHAR of the line where the cursor was before the latest jump.",
  "mode": "n"
},
{
  "tag": "'(",
  "char": "'(",
  "note": "1",
  "summary": "cursor to the first CHAR on the line of the start of the current sentence",
  "mode": "n"
},
{
  "tag": "')",
  "char": "')",
  "note": "1",
  "summary": "cursor to the first CHAR on the line of the end of the current sentence",
  "mode": "n"
},
{
  "tag": "'<",
  "char": "'<",
  "note": "1",
  "summary": "cursor to the first CHAR of the line where highlighted area starts/started in the current buffer.",
  "mode": "n"
},
{
  "tag": "'>",
  "char": "'>",
  "note": "1",
  "summary": "cursor to the first CHAR of the line where highlighted area ends/ended in the current buffer.",
  "mode": "n"
},
{
  "tag": "'[",
  "char": "'[",
  "note": "1",
  "summary": "cursor to the first CHAR on the line of the start of last operated text or start of put text",
  "mode": "n"
},
{
  "tag": "']",
  "char": "']",
  "note": "1",
  "summary": "cursor to the first CHAR on the line of the end of last operated text or end of put text",
  "mode": "n"
},
{
  "tag": "'{",
  "char": "'{",
  "note": "1",
  "summary": "cursor to the first CHAR on the line of the start of the current paragraph",
  "mode": "n"
},
{
  "tag": "'}",
  "char": "'}",
  "note": "1",
  "summary": "cursor to the first CHAR on the line of the end of the current paragraph",
  "mode": "n"
},
{
  "tag": "(",
  "char": "(",
  "note": "1",
  "summary": "cursor N sentences backward",
  "mode": "n"
},
{
  "tag": ")",
  "char": ")",
  "note": "1",
  "summary": "cursor N sentences forward",
  "mode": "n"
},
{
  "tag": "star",
  "char": "*",
  "note": "1",
  "summary": "search forward for the Nth occurrence of the ident under the cursor",
  "mode": "n"
},
{
  "tag": "+",
  "char": "+",
  "note": "1",
  "summary": "same as <CR>",
  "mode": "n"
},
{
  "tag": ",",
  "char": ",",
  "note": "1",
  "summary": "repeat latest f, t, F or T in opposite direction N times",
  "mode": "n"
},
{
  "tag": "-",
  "char": "-",
  "note": "1",
  "summary": "cursor to the first CHAR N lines higher",
  "mode": "n"
},
{
  "tag": ".",
  "char": ".",
  "note": "2",
  "summary": "repeat last change with count replaced with N",
  "mode": "n"
},
{
  "tag": "/",
  "char": "/{pattern}<CR>",
  "note": "1",
  "summary": "search forward for the Nth occurrence of {pattern}",
  "mode": "n"
},
{
  "tag": "/<CR>",
  "char": "/<CR>",
  "note": "1",
  "summary": "search forward for {pattern} of last search",
  "mode": "n"
},
{
  "tag": "count",
  "char": "0",
  "note": "1",
  "summary": "cursor to the first char of the line",
  "mode": "n"
},
{
  "tag": "count",
  "char": "1",
  "summary": "prepend to command to give a count",
  "mode": "n"
},
{
  "tag": "count",
  "char": "2",
  "summary": "prepend to command to give a count",
  "mode": "n"
},
{
  "tag": "count",
  "char": "3",
  "summary": "prepend to command to give a count",
  "mode": "n"
},
{
  "tag": "count",
  "char": "4",
  "summary": "prepend to command to give a count",
  "mode": "n"
},
{
  "tag": "count",
  "char": "5",
  "summary": "prepend to command to give a count",
  "mode": "n"
},
{
  "tag": "count",
  "char": "6",
  "summary": "prepend to command to give a count",
  "mode": "n"
},
{
  "tag": "count",
  "char": "7",
  "summary": "prepend to command to give a count",
  "mode": "n"
},
{
  "tag": "count",
  "char": "8",
  "summary": "prepend to command to give a count",
  "mode": "n"
},
{
  "tag": "count",
  "char": "9",
  "summary": "prepend to command to give a count",
  "mode": "n"
},
{
  "tag": ":",
  "char": ":",
  "note": "1",
  "summary": "start entering an Ex command",
  "mode": "n"
},
{
  "tag": "N:",
  "char": "{count}:",
  "summary": "start entering an Ex command with range from current line to N-1 lines down",
  "mode": "n"
},
{
  "tag": ";",
  "char": ";",
  "note": "1",
  "summary": "repeat latest f, t, F or T N times",
  "mode": "n"
},
{
  "tag": "<",
  "char": "<{motion}",
  "note": "2",
  "summary": "shift Nmove lines one 'shiftwidth' leftwards",
  "mode": "n"
},
{
  "tag": "<<",
  "char": "<<",
  "note": "2",
  "summary": "shift N lines one 'shiftwidth' leftwards",
  "mode": "n"
},
{
  "tag": "=",
  "char": "={motion}",
  "note": "2",
  "summary": "filter Nmove lines through 'indent'",
  "mode": "n"
},
{
  "tag": "==",
  "char": "==",
  "note": "2",
  "summary": "filter N lines through 'indent'",
  "mode": "n"
},
{
  "tag": ">",
  "char": ">{motion}",
  "note": "2",
  "summary": "shift Nmove lines one 'shiftwidth' rightwards",
  "mode": "n"
},
{
  "tag": ">>",
  "char": ">>",
  "note": "2",
  "summary": "shift N lines one 'shiftwidth' rightwards",
  "mode": "n"
},
{
  "tag": "?",
  "char": "?{pattern}<CR>",
  "note": "1",
  "summary": "search backward for the Nth previous occurrence of {pattern}",
  "mode": "n"
},
{
  "tag": "?<CR>",
  "char": "?<CR>",
  "note": "1",
  "summary": "search backward for {pattern} of last search",
  "mode": "n"
},
{
  "tag": "@",
  "char": "@{a-z}",
  "note": "2",
  "summary": "execute the contents of register {a-z} N times",
  "mode": "n"
},
{
  "tag": "@:",
  "char": "@:",
  "summary": "repeat the previous ':' command N times",
  "mode": "n"
},
{
  "tag": "@@",
  "char": "@@",
  "note": "2",
  "summary": "repeat the previous @{a-z} N times",
  "mode": "n"
},
{
  "tag": "A",
  "char": "A",
  "note": "2",
  "summary": "append text after the end of the line N times",
  "mode": "n"
},
{
  "tag": "B",
  "char": "B",
  "note": "1",
  "summary": "cursor N WORDS backward",
  "mode": "n"
},
{
  "tag": "C",
  "char": "[\"x]C",
  "note": "2",
  "summary": "change from the cursor position to the end of the line, and N-1 more lines [into register x]; synonym for 'c$'",
  "mode": "n"
},
{
  "tag": "D",
  "char": "[\"x]D",
  "note": "2",
  "summary": "delete the characters under the cursor until the end of the line and N-1 more lines [into register x]; synonym for 'd$'",
  "mode": "n"
},
{
  "tag": "E",
  "char": "E",
  "note": "1",
  "summary": "cursor forward to the end of WORD N",
  "mode": "n"
},
{
  "tag": "F",
  "char": "F{char}",
  "note": "1",
  "summary": "cursor to the Nth occurrence of {char} to the left",
  "mode": "n"
},
{
  "tag": "G",
  "char": "G",
  "note": "1",
  "summary": "cursor to line N, default last line",
  "mode": "n"
},
{
  "tag": "H",
  "char": "H",
  "note": "1",
  "summary": "cursor to line N from top of screen",
  "mode": "n"
},
{
  "tag": "I",
  "char": "I",
  "note": "2",
  "summary": "insert text before the first CHAR on the line N times",
  "mode": "n"
},
{
  "tag": "J",
  "char": "J",
  "note": "2",
  "summary": "Join N lines; default is 2",
  "mode": "n"
},
{
  "tag": "K",
  "char": "K",
  "summary": "lookup Keyword under the cursor with 'keywordprg'",
  "mode": "n"
},
{
  "tag": "L",
  "char": "L",
  "note": "1",
  "summary": "cursor to line N from bottom of screen",
  "mode": "n"
},
{
  "tag": "M",
  "char": "M",
  "note": "1",
  "summary": "cursor to middle line of screen",
  "mode": "n"
},
{
  "tag": "N",
  "char": "N",
  "note": "1",
  "summary": "repeat the latest '/' or '?' N times in opposite direction",
  "mode": "n"
},
{
  "tag": "O",
  "char": "O",
  "note": "2",
  "summary": "begin a new line above the cursor and insert text, repeat N times",
  "mode": "n"
},
{
  "tag": "P",
  "char": "[\"x]P",
  "note": "2",
  "summary": "put the text [from register x] before the cursor N times",
  "mode": "n"
},
{
  "tag": "R",
  "char": "R",
  "note": "2",
  "summary": "enter replace mode: overtype existing characters, repeat the entered text N-1 times",
  "mode": "n"
},
{
  "tag": "S",
  "char": "[\"x]S",
  "note": "2",
  "summary": "delete N lines [into register x] and start insert; synonym for 'cc'.",
  "mode": "n"
},
{
  "tag": "T",
  "char": "T{char}",
  "note": "1",
  "summary": "cursor till after Nth occurrence of {char} to the left",
  "mode": "n"
},
{
  "tag": "U",
  "char": "U",
  "note": "2",
  "summary": "undo all latest changes on one line",
  "mode": "n"
},
{
  "tag": "V",
  "char": "V",
  "summary": "start linewise Visual mode",
  "mode": "n"
},
{
  "tag": "W",
  "char": "W",
  "note": "1",
  "summary": "cursor N WORDS forward",
  "mode": "n"
},
{
  "tag": "X",
  "char": "[\"x]X",
  "note": "2",
  "summary": "delete N characters before the cursor [into register x]",
  "mode": "n"
},
{
  "tag": "Y",
  "char": "[\"x]Y",
  "summary": "yank N lines [into register x]; synonym for 'yy'; mapped to 'y$' by default |default-mappings|",
  "mode": "n"
},
{
  "tag": "ZZ",
  "char": "ZZ",
  "summary": "write if buffer changed and close window",
  "mode": "n"
},
{
  "tag": "ZQ",
  "char": "ZQ",
  "summary": "close window without writing",
  "mode": "n"
},
{
  "tag": "[",
  "char": "[{char}",
  "summary": "square bracket command (see |[| below)",
  "mode": "n"
},
{
  "tag": "<NONE>",
  "char": "\\",
  "summary": "not used",
  "mode": "n"
},
{
  "tag": "]",
  "char": "]{char}",
  "summary": "square bracket command (see |]| below)",
  "mode": "n"
},
{
  "tag": "^",
  "char": "^",
  "note": "1",
  "summary": "cursor to the first CHAR of the line",
  "mode": "n"
},
{
  "tag": "_",
  "char": "_",
  "note": "1",
  "summary": "cursor to the first CHAR N - 1 lines lower",
  "mode": "n"
},
{
  "tag": "`",
  "char": "`{a-zA-Z0-9}",
  "note": "1",
  "summary": "cursor to the mark {a-zA-Z0-9}",
  "mode": "n"
},
{
  "tag": "`(",
  "char": "`(",
  "note": "1",
  "summary": "cursor to the start of the current sentence",
  "mode": "n"
},
{
  "tag": "`)",
  "char": "`)",
  "note": "1",
  "summary": "cursor to the end of the current sentence",
  "mode": "n"
},
{
  "tag": "`<",
  "char": "`<",
  "note": "1",
  "summary": "cursor to the start of the highlighted area",
  "mode": "n"
},
{
  "tag": "`>",
  "char": "`>",
  "note": "1",
  "summary": "cursor to the end of the highlighted area",
  "mode": "n"
},
{
  "tag": "`[",
  "char": "`[",
  "note": "1",
  "summary": "cursor to the start of last operated text or start of putted text",
  "mode": "n"
},
{
  "tag": "`]",
  "char": "`]",
  "note": "1",
  "summary": "cursor to the end of last operated text or end of putted text",
  "mode": "n"
},
{
  "tag": "``",
  "char": "``",
  "note": "1",
  "summary": "cursor to the position before latest jump",
  "mode": "n"
},
{
  "tag": "`{",
  "char": "`{",
  "note": "1",
  "summary": "cursor to the start of the current paragraph",
  "mode": "n"
},
{
  "tag": "`}",
  "char": "`}",
  "note": "1",
  "summary": "cursor to the end of the current paragraph",
  "mode": "n"
},
{
  "tag": "a",
  "char": "a",
  "note": "2",
  "summary": "append text after the cursor N times",
  "mode": "n"
},
{
  "tag": "b",
  "char": "b",
  "note": "1",
  "summary": "cursor N words backward",
  "mode": "n"
},
{
  "tag": "c",
  "char": "[\"x]c{motion}",
  "note": "2",
  "summary": "delete Nmove text [into register x] and start insert",
  "mode": "n"
},
{
  "tag": "cc",
  "char": "[\"x]cc",
  "note": "2",
  "summary": "delete N lines [into register x] and start insert",
  "mode": "n"
},
{
  "tag": "d",
  "char": "[\"x]d{motion}",
  "note": "2",
  "summary": "delete Nmove text [into register x]",
  "mode": "n"
},
{
  "tag": "dd",
  "char": "[\"x]dd",
  "note": "2",
  "summary": "delete N lines [into register x]",
  "mode": "n"
},
{
  "tag": "do",
  "char": "do",
  "note": "2",
  "summary": "same as ':diffget'",
  "mode": "n"
},
{
  "tag": "dp",
  "char": "dp",
  "note": "2",
  "summary": "same as ':diffput'",
  "mode": "n"
},
{
  "tag": "e",
  "char": "e",
  "note": "1",
  "summary": "cursor forward to the end of word N",
  "mode": "n"
},
{
  "tag": "f",
  "char": "f{char}",
  "note": "1",
  "summary": "cursor to Nth occurrence of {char} to the right",
  "mode": "n"
},
{
  "tag": "g",
  "char": "g{char}",
  "summary": "extended commands, see |g| below",
  "mode": "n"
},
{
  "tag": "h",
  "char": "h",
  "note": "1",
  "summary": "cursor N chars to the left",
  "mode": "n"
},
{
  "tag": "i",
  "char": "i",
  "note": "2",
  "summary": "insert text before the cursor N times",
  "mode": "n"
},
{
  "tag": "j",
  "char": "j",
  "note": "1",
  "summary": "cursor N lines downward",
  "mode": "n"
},
{
  "tag": "k",
  "char": "k",
  "note": "1",
  "summary": "cursor N lines upward",
  "mode": "n"
},
{
  "tag": "l",
  "char": "l",
  "note": "1",
  "summary": "cursor N chars to the right",
  "mode": "n"
},
{
  "tag": "m",
  "char": "m{A-Za-z}",
  "summary": "set mark {A-Za-z} at cursor position",
  "mode": "n"
},
{
  "tag": "n",
  "char": "n",
  "note": "1",
  "summary": "repeat the latest '/' or '?' N times",
  "mode": "n"
},
{
  "tag": "o",
  "char": "o",
  "note": "2",
  "summary": "begin a new line below the cursor and insert text, repeat N times",
  "mode": "n"
},
{
  "tag": "p",
  "char": "[\"x]p",
  "note": "2",
  "summary": "put the text [from register x] after the cursor N times",
  "mode": "n"
},
{
  "tag": "q",
  "char": "q{0-9a-zA-Z\"}",
  "summary": "record typed characters into named register {0-9a-zA-Z\"} (uppercase to append)",
  "mode": "n"
},
{
  "tag": "q",
  "char": "q",
  "summary": "(while recording) stops recording",
  "mode": "n"
},
{
  "tag": "Q",
  "char": "Q",
  "summary": "replay last recorded macro",
  "mode": "n"
},
{
  "tag": "q:",
  "char": "q:",
  "summary": "edit : command-line in command-line window",
  "mode": "n"
},
{
  "tag": "q/",
  "char": "q/",
  "summary": "edit / command-line in command-line window",
  "mode": "n"
},
{
  "tag": "q?",
  "char": "q?",
  "summary": "edit ? command-line in command-line window",
  "mode": "n"
},
{
  "tag": "r",
  "char": "r{char}",
  "note": "2",
  "summary": "replace N chars with {char}",
  "mode": "n"
},
{
  "tag": "s",
  "char": "[\"x]s",
  "note": "2",
  "summary": "(substitute) delete N characters [into register x] and start insert",
  "mode": "n"
},
{
  "tag": "t",
  "char": "t{char}",
  "note": "1",
  "summary": "cursor till before Nth occurrence of {char} to the right",
  "mode": "n"
},
{
  "tag": "u",
  "char": "u",
  "note": "2",
  "summary": "undo changes",
  "mode": "n"
},
{
  "tag": "v",
  "char": "v",
  "summary": "start charwise Visual mode",
  "mode": "n"
},
{
  "tag": "w",
  "char": "w",
  "note": "1",
  "summary": "cursor N words forward",
  "mode": "n"
},
{
  "tag": "x",
  "char": "[\"x]x",
  "note": "2",
  "summary": "delete N characters under and after the cursor [into register x]",
  "mode": "n"
},
{
  "tag": "y",
  "char": "[\"x]y{motion}",
  "summary": "yank Nmove text [into register x]",
  "mode": "n"
},
{
  "tag": "yy",
  "char": "[\"x]yy",
  "summary": "yank N lines [into register x]",
  "mode": "n"
},
{
  "tag": "z",
  "char": "z{char}",
  "summary": "commands starting with 'z', see |z| below",
  "mode": "n"
},
{
  "tag": "{",
  "char": "{",
  "note": "1",
  "summary": "cursor N paragraphs backward",
  "mode": "n"
},
{
  "tag": "bar",
  "char": "|",
  "note": "1",
  "summary": "cursor to column N",
  "mode": "n"
},
{
  "tag": "}",
  "char": "}",
  "note": "1",
  "summary": "cursor N paragraphs forward",
  "mode": "n"
},
{
  "tag": "~",
  "char": "~",
  "note": "2",
  "summary": "'tildeop' off: switch case of N characters under cursor and move the cursor N characters to the right",
  "mode": "n"
},
{
  "tag": "~",
  "char": "~{motion}",
  "summary": "'tildeop' on: switch case of Nmove text",
  "mode": "n"
},
{
  "tag": "<C-End>",
  "char": "<C-End>",
  "note": "1",
  "summary": "same as 'G'",
  "mode": "n"
},
{
  "tag": "<C-Home>",
  "char": "<C-Home>",
  "note": "1",
  "summary": "same as 'gg'",
  "mode": "n"
},
{
  "tag": "<C-Left>",
  "char": "<C-Left>",
  "note": "1",
  "summary": "same as 'b'",
  "mode": "n"
},
{
  "tag": "<C-LeftMouse>",
  "char": "<C-LeftMouse>",
  "summary": "':ta' to the keyword at the mouse click",
  "mode": "n"
},
{
  "tag": "<C-Right>",
  "char": "<C-Right>",
  "note": "1",
  "summary": "same as 'w'",
  "mode": "n"
},
{
  "tag": "<C-RightMouse>",
  "char": "<C-RightMouse>",
  "summary": "same as 'CTRL-T'",
  "mode": "n"
},
{
  "tag": "<C-Tab>",
  "char": "<C-Tab>",
  "summary": "same as 'g<Tab>'",
  "mode": "n"
},
{
  "tag": "<Del>",
  "char": "[\"x]<Del>",
  "note": "2",
  "summary": "same as 'x'",
  "mode": "n"
},
{
  "tag": "N<Del>",
  "char": "{count}<Del>",
  "summary": "remove the last digit from {count}",
  "mode": "n"
},
{
  "tag": "<Down>",
  "char": "<Down>",
  "note": "1",
  "summary": "same as 'j'",
  "mode": "n"
},
{
  "tag": "<End>",
  "char": "<End>",
  "note": "1",
  "summary": "same as '$'",
  "mode": "n"
},
{
  "tag": "<F1>",
  "char": "<F1>",
  "summary": "same as <Help>",
  "mode": "n"
},
{
  "tag": "<Help>",
  "char": "<Help>",
  "summary": "open a help window",
  "mode": "n"
},
{
  "tag": "<Home>",
  "char": "<Home>",
  "note": "1",
  "summary": "same as '0'",
  "mode": "n"
},
{
  "tag": "<Insert>",
  "char": "<Insert>",
  "note": "2",
  "summary": "same as 'i'",
  "mode": "n"
},
{
  "tag": "<Left>",
  "char": "<Left>",
  "note": "1",
  "summary": "same as 'h'",
  "mode": "n"
},
{
  "tag": "<LeftMouse>",
  "char": "<LeftMouse>",
  "note": "1",
  "summary": "move cursor to the mouse click position",
  "mode": "n"
},
{
  "tag": "<MiddleMouse>",
  "char": "<MiddleMouse>",
  "note": "2",
  "summary": "same as 'gP' at the mouse click position",
  "mode": "n"
},
{
  "tag": "<PageDown>",
  "char": "<PageDown>",
  "summary": "same as CTRL-F",
  "mode": "n"
},
{
  "tag": "<PageUp>",
  "char": "<PageUp>",
  "summary": "same as CTRL-B",
  "mode": "n"
},
{
  "tag": "<Right>",
  "char": "<Right>",
  "note": "1",
  "summary": "same as 'l'",
  "mode": "n"
},
{
  "tag": "<RightMouse>",
  "char": "<RightMouse>",
  "summary": "start Visual mode, move cursor to the mouse click position",
  "mode": "n"
},
{
  "tag": "<S-Down>",
  "char": "<S-Down>",
  "note": "1",
  "summary": "same as CTRL-F",
  "mode": "n"
},
{
  "tag": "<S-Left>",
  "char": "<S-Left>",
  "note": "1",
  "summary": "same as 'b'",
  "mode": "n"
},
{
  "tag": "<S-LeftMouse>",
  "char": "<S-LeftMouse>",
  "summary": "same as '*' at the mouse click position",
  "mode": "n"
},
{
  "tag": "<S-Right>",
  "char": "<S-Right>",
  "note": "1",
  "summary": "same as 'w'",
  "mode": "n"
},
{
  "tag": "<S-RightMouse>",
  "char": "<S-RightMouse>",
  "summary": "same as '#' at the mouse click position",
  "mode": "n"
},
{
  "tag": "<S-Up>",
  "char": "<S-Up>",
  "note": "1",
  "summary": "same as CTRL-B",
  "mode": "n"
},
{
  "tag": "<Undo>",
  "char": "<Undo>",
  "note": "2",
  "summary": "same as 'u'",
  "mode": "n"
},
{
  "tag": "<Up>",
  "char": "<Up>",
  "note": "1",
  "summary": "same as 'k'",
  "mode": "n"
},
{
  "tag": "<ScrollWheelDown>",
  "char": "<ScrollWheelDown>",
  "summary": "move window three lines down",
  "mode": "n"
},
{
  "tag": "<S-ScrollWheelDown>",
  "char": "<S-ScrollWheelDown>",
  "summary": "move window one page down",
  "mode": "n"
},
{
  "tag": "<ScrollWheelUp>",
  "char": "<ScrollWheelUp>",
  "summary": "move window three lines up",
  "mode": "n"
},
{
  "tag": "<S-ScrollWheelUp>",
  "char": "<S-ScrollWheelUp>",
  "summary": "move window one page up",
  "mode": "n"
},
{
  "tag": "<ScrollWheelLeft>",
  "char": "<ScrollWheelLeft>",
  "summary": "move window six columns left",
  "mode": "n"
},
{
  "tag": "<S-ScrollWheelLeft>",
  "char": "<S-ScrollWheelLeft>",
  "summary": "move window one page left",
  "mode": "n"
},
{
  "tag": "<ScrollWheelRight>",
  "char": "<ScrollWheelRight>",
  "summary": "move window six columns right",
  "mode": "n"
},
{
  "tag": "<S-ScrollWheelRight>",
  "char": "<S-ScrollWheelRight>",
  "summary": "move window one page right",
  "mode": "n"
},
{
  "tag": "v_aquote",
  "char": "a\"",
  "summary": "double quoted string",
  "mode": "vo"
},
{
  "tag": "v_a'",
  "char": "a'",
  "summary": "single quoted string",
  "mode": "vo"
},
{
  "tag": "v_a(",
  "char": "a(",
  "summary": "same as ab",
  "mode": "vo"
},
{
  "tag": "v_a)",
  "char": "a)",
  "summary": "same as ab",
  "mode": "vo"
},
{
  "tag": "v_a<",
  "char": "a<",
  "summary": "'a <>' from '<' to the matching '>'",
  "mode": "vo"
},
{
  "tag": "v_a>",
  "char": "a>",
  "summary": "same as a<",
  "mode": "vo"
},
{
  "tag": "v_aB",
  "char": "aB",
  "summary": "'a Block' from '[{' to ']}' (with brackets)",
  "mode": "vo"
},
{
  "tag": "v_aW",
  "char": "aW",
  "summary": "'a WORD' (with white space)",
  "mode": "vo"
},
{
  "tag": "v_a[",
  "char": "a[",
  "summary": "'a []' from '[' to the matching ']'",
  "mode": "vo"
},
{
  "tag": "v_a]",
  "char": "a]",
  "summary": "same as a[",
  "mode": "vo"
},
{
  "tag": "v_a`",
  "char": "a`",
  "summary": "string in backticks",
  "mode": "vo"
},
{
  "tag": "v_ab",
  "char": "ab",
  "summary": "'a block' from '[(' to '])' (with braces)",
  "mode": "vo"
},
{
  "tag": "v_ap",
  "char": "ap",
  "summary": "'a paragraph' (with white space)",
  "mode": "vo"
},
{
  "tag": "v_as",
  "char": "as",
  "summary": "'a sentence' (with white space)",
  "mode": "vo"
},
{
  "tag": "v_at",
  "char": "at",
  "summary": "'a tag block' (with white space)",
  "mode": "vo"
},
{
  "tag": "v_aw",
  "char": "aw",
  "summary": "'a word' (with white space)",
  "mode": "vo"
},
{
  "tag": "v_a{",
  "char": "a{",
  "summary": "same as aB",
  "mode": "vo"
},
{
  "tag": "v_a}",
  "char": "a}",
  "summary": "same as aB",
  "mode": "vo"
},
{
  "tag": "v_iquote",
  "char": "i\"",
  "summary": "double quoted string without the quotes",
  "mode": "vo"
},
{
  "tag": "v_i'",
  "char": "i'",
  "summary": "single quoted string without the quotes",
  "mode": "vo"
},
{
  "tag": "v_i(",
  "char": "i(",
  "summary": "same as ib",
  "mode": "vo"
},
{
  "tag": "v_i)",
  "char": "i)",
  "summary": "same as ib",
  "mode": "vo"
},
{
  "tag": "v_i<",
  "char": "i<",
  "summary": "'inner <>' from '<' to the matching '>'",
  "mode": "vo"
},
{
  "tag": "v_i>",
  "char": "i>",
  "summary": "same as i<",
  "mode": "vo"
},
{
  "tag": "v_iB",
  "char": "iB",
  "summary": "'inner Block' from '[{' and ']}'",
  "mode": "vo"
},
{
  "tag": "v_iW",
  "char": "iW",
  "summary": "'inner WORD'",
  "mode": "vo"
},
{
  "tag": "v_i[",
  "char": "i[",
  "summary": "'inner []' from '[' to the matching ']'",
  "mode": "vo"
},
{
  "tag": "v_i]",
  "char": "i]",
  "summary": "same as i[",
  "mode": "vo"
},
{
  "tag": "v_i`",
  "char": "i`",
  "summary": "string in backticks without the backticks",
  "mode": "vo"
},
{
  "tag": "v_ib",
  "char": "ib",
  "summary": "'inner block' from '[(' to '])'",
  "mode": "vo"
},
{
  "tag": "v_ip",
  "char": "ip",
  "summary": "'inner paragraph'",
  "mode": "vo"
},
{
  "tag": "v_is",
  "char": "is",
  "summary": "'inner sentence'",
  "mode": "vo"
},
{
  "tag": "v_it",
  "char": "it",
  "summary": "'inner tag block'",
  "mode": "vo"
},
{
  "tag": "v_iw",
  "char": "iw",
  "summary": "'inner word'",
  "mode": "vo"
},
{
  "tag": "v_i{",
  "char": "i{",
  "summary": "same as iB",
  "mode": "vo"
},
{
  "tag": "v_i}",
  "char": "i}",
  "summary": "same as iB",
  "mode": "vo"
},
{
  "tag": "CTRL-W_CTRL-B",
  "char": "CTRL-W CTRL-B",
  "summary": "same as 'CTRL-W b'",
  "mode": "n"
},
{
  "tag": "CTRL-W_CTRL-C",
  "char": "CTRL-W CTRL-C",
  "summary": "same as 'CTRL-W c'",
  "mode": "n"
},
{
  "tag": "CTRL-W_CTRL-D",
  "char": "CTRL-W CTRL-D",
  "summary": "same as 'CTRL-W d'",
  "mode": "n"
},
{
  "tag": "CTRL-W_CTRL-F",
  "char": "CTRL-W CTRL-F",
  "summary": "same as 'CTRL-W f'",
  "mode": "n"
},
{
  "tag": "<NONE>",
  "char": "CTRL-W CTRL-G",
  "summary": "same as 'CTRL-W g ..'",
  "mode": "n"
},
{
  "tag": "CTRL-W_CTRL-H",
  "char": "CTRL-W CTRL-H",
  "summary": "same as 'CTRL-W h'",
  "mode": "n"
},
{
  "tag": "CTRL-W_CTRL-I",
  "char": "CTRL-W CTRL-I",
  "summary": "same as 'CTRL-W i'",
  "mode": "n"
},
{
  "tag": "CTRL-W_CTRL-J",
  "char": "CTRL-W CTRL-J",
  "summary": "same as 'CTRL-W j'",
  "mode": "n"
},
{
  "tag": "CTRL-W_CTRL-K",
  "char": "CTRL-W CTRL-K",
  "summary": "same as 'CTRL-W k'",
  "mode": "n"
},
{
  "tag": "CTRL-W_CTRL-L",
  "char": "CTRL-W CTRL-L",
  "summary": "same as 'CTRL-W l'",
  "mode": "n"
},
{
  "tag": "CTRL-W_CTRL-N",
  "char": "CTRL-W CTRL-N",
  "summary": "same as 'CTRL-W n'",
  "mode": "n"
},
{
  "tag": "CTRL-W_CTRL-O",
  "char": "CTRL-W CTRL-O",
  "summary": "same as 'CTRL-W o'",
  "mode": "n"
},
{
  "tag": "CTRL-W_CTRL-P",
  "char": "CTRL-W CTRL-P",
  "summary": "same as 'CTRL-W p'",
  "mode": "n"
},
{
  "tag": "CTRL-W_CTRL-Q",
  "char": "CTRL-W CTRL-Q",
  "summary": "same as 'CTRL-W q'",
  "mode": "n"
},
{
  "tag": "CTRL-W_CTRL-R",
  "char": "CTRL-W CTRL-R",
  "summary": "same as 'CTRL-W r'",
  "mode": "n"
},
{
  "tag": "CTRL-W_CTRL-S",
  "char": "CTRL-W CTRL-S",
  "summary": "same as 'CTRL-W s'",
  "mode": "n"
},
{
  "tag": "CTRL-W_CTRL-T",
  "char": "CTRL-W CTRL-T",
  "summary": "same as 'CTRL-W t'",
  "mode": "n"
},
{
  "tag": "CTRL-W_CTRL-V",
  "char": "CTRL-W CTRL-V",
  "summary": "same as 'CTRL-W v'",
  "mode": "n"
},
{
  "tag": "CTRL-W_CTRL-W",
  "char": "CTRL-W CTRL-W",
  "summary": "same as 'CTRL-W w'",
  "mode": "n"
},
{
  "tag": "CTRL-W_CTRL-X",
  "char": "CTRL-W CTRL-X",
  "summary": "same as 'CTRL-W x'",
  "mode": "n"
},
{
  "tag": "CTRL-W_CTRL-Z",
  "char": "CTRL-W CTRL-Z",
  "summary": "same as 'CTRL-W z'",
  "mode": "n"
},
{
  "tag": "CTRL-W_CTRL-]",
  "char": "CTRL-W CTRL-]",
  "summary": "same as 'CTRL-W ]'",
  "mode": "n"
},
{
  "tag": "CTRL-W_CTRL-^",
  "char": "CTRL-W CTRL-^",
  "summary": "same as 'CTRL-W ^'",
  "mode": "n"
},
{
  "tag": "CTRL-W_CTRL-_",
  "char": "CTRL-W CTRL-_",
  "summary": "same as 'CTRL-W _'",
  "mode": "n"
},
{
  "tag": "CTRL-W_+",
  "char": "CTRL-W +",
  "summary": "increase current window height N lines",
  "mode": "n"
},
{
  "tag": "CTRL-W_-",
  "char": "CTRL-W -",
  "summary": "decrease current window height N lines",
  "mode": "n"
},
{
  "tag": "CTRL-W_<",
  "char": "CTRL-W <",
  "summary": "decrease current window width N columns",
  "mode": "n"
},
{
  "tag": "CTRL-W_=",
  "char": "CTRL-W =",
  "summary": "make all windows the same height & width",
  "mode": "n"
},
{
  "tag": "CTRL-W_>",
  "char": "CTRL-W >",
  "summary": "increase current window width N columns",
  "mode": "n"
},
{
  "tag": "CTRL-W_H",
  "char": "CTRL-W H",
  "summary": "move current window to the far left",
  "mode": "n"
},
{
  "tag": "CTRL-W_J",
  "char": "CTRL-W J",
  "summary": "move current window to the very bottom",
  "mode": "n"
},
{
  "tag": "CTRL-W_K",
  "char": "CTRL-W K",
  "summary": "move current window to the very top",
  "mode": "n"
},
{
  "tag": "CTRL-W_L",
  "char": "CTRL-W L",
  "summary": "move current window to the far right",
  "mode": "n"
},
{
  "tag": "CTRL-W_P",
  "char": "CTRL-W P",
  "summary": "go to preview window",
  "mode": "n"
},
{
  "tag": "CTRL-W_R",
  "char": "CTRL-W R",
  "summary": "rotate windows upwards N times",
  "mode": "n"
},
{
  "tag": "CTRL-W_S",
  "char": "CTRL-W S",
  "summary": "same as 'CTRL-W s'",
  "mode": "n"
},
{
  "tag": "CTRL-W_T",
  "char": "CTRL-W T",
  "summary": "move current window to a new tab page",
  "mode": "n"
},
{
  "tag": "CTRL-W_W",
  "char": "CTRL-W W",
  "summary": "go to N previous window (wrap around)",
  "mode": "n"
},
{
  "tag": "CTRL-W_]",
  "char": "CTRL-W ]",
  "summary": "split window and jump to tag under cursor",
  "mode": "n"
},
{
  "tag": "CTRL-W_^",
  "char": "CTRL-W ^",
  "summary": "split current window and edit alternate file N",
  "mode": "n"
},
{
  "tag": "CTRL-W__",
  "char": "CTRL-W _",
  "summary": "set current window height to N (default: very high)",
  "mode": "n"
},
{
  "tag": "CTRL-W_b",
  "char": "CTRL-W b",
  "summary": "go to bottom window",
  "mode": "n"
},
{
  "tag": "CTRL-W_c",
  "char": "CTRL-W c",
  "summary": "close current window (like |:close|)",
  "mode": "n"
},
{
  "tag": "CTRL-W_d",
  "char": "CTRL-W d",
  "summary": "split window and jump to definition under the cursor",
  "mode": "n"
},
{
  "tag": "CTRL-W_f",
  "char": "CTRL-W f",
  "summary": "split window and edit file name under the cursor",
  "mode": "n"
},
{
  "tag": "CTRL-W_F",
  "char": "CTRL-W F",
  "summary": "split window and edit file name under the cursor and jump to the line number following the file name.",
  "mode": "n"
},
{
  "tag": "CTRL-W_g_CTRL-]",
  "char": "CTRL-W g CTRL-]",
  "summary": "split window and do |:tjump| to tag under cursor",
  "mode": "n"
},
{
  "tag": "CTRL-W_g]",
  "char": "CTRL-W g ]",
  "summary": "split window and do |:tselect| for tag under cursor",
  "mode": "n"
},
{
  "tag": "CTRL-W_g}",
  "char": "CTRL-W g }",
  "summary": "do a |:ptjump| to the tag under the cursor",
  "mode": "n"
},
{
  "tag": "CTRL-W_gf",
  "char": "CTRL-W g f",
  "summary": "edit file name under the cursor in a new tab page",
  "mode": "n"
},
{
  "tag": "CTRL-W_gF",
  "char": "CTRL-W g F",
  "summary": "edit file name under the cursor in a new tab page and jump to the line number following the file name.",
  "mode": "n"
},
{
  "tag": "CTRL-W_gt",
  "char": "CTRL-W g t",
  "summary": "same as `gt`: go to next tab page",
  "mode": "n"
},
{
  "tag": "CTRL-W_gT",
  "char": "CTRL-W g T",
  "summary": "same as `gT`: go to previous tab page",
  "mode": "n"
},
{
  "tag": "CTRL-W_g<Tab>",
  "char": "CTRL-W g <Tab>",
  "summary": "same as |g<Tab>|: go to last accessed tab page",
  "mode": "n"
},
{
  "tag": "CTRL-W_h",
  "char": "CTRL-W h",
  "summary": "go to Nth left window (stop at first window)",
  "mode": "n"
},
{
  "tag": "CTRL-W_i",
  "char": "CTRL-W i",
  "summary": "split window and jump to declaration of identifier under the cursor",
  "mode": "n"
},
{
  "tag": "CTRL-W_j",
  "char": "CTRL-W j",
  "summary": "go N windows down (stop at last window)",
  "mode": "n"
},
{
  "tag": "CTRL-W_k",
  "char": "CTRL-W k",
  "summary": "go N windows up (stop at first window)",
  "mode": "n"
},
{
  "tag": "CTRL-W_l",
  "char": "CTRL-W l",
  "summary": "go to Nth right window (stop at last window)",
  "mode": "n"
},
{
  "tag": "CTRL-W_n",
  "char": "CTRL-W n",
  "summary": "open new window, N lines high",
  "mode": "n"
},
{
  "tag": "CTRL-W_o",
  "char": "CTRL-W o",
  "summary": "close all but current window (like |:only|)",
  "mode": "n"
},
{
  "tag": "CTRL-W_p",
  "char": "CTRL-W p",
  "summary": "go to previous (last accessed) window",
  "mode": "n"
},
{
  "tag": "CTRL-W_q",
  "char": "CTRL-W q",
  "summary": "quit current window (like |:quit|)",
  "mode": "n"
},
{
  "tag": "CTRL-W_r",
  "char": "CTRL-W r",
  "summary": "rotate windows downwards N times",
  "mode": "n"
},
{
  "tag": "CTRL-W_s",
  "char": "CTRL-W s",
  "summary": "split current window in two parts, new window N lines high",
  "mode": "n"
},
{
  "tag": "CTRL-W_t",
  "char": "CTRL-W t",
  "summary": "go to top window",
  "mode": "n"
},
{
  "tag": "CTRL-W_v",
  "char": "CTRL-W v",
  "summary": "split current window vertically, new window N columns wide",
  "mode": "n"
},
{
  "tag": "CTRL-W_w",
  "char": "CTRL-W w",
  "summary": "go to N next window (wrap around)",
  "mode": "n"
},
{
  "tag": "CTRL-W_x",
  "char": "CTRL-W x",
  "summary": "exchange current window with window N (default: next window)",
  "mode": "n"
},
{
  "tag": "CTRL-W_z",
  "char": "CTRL-W z",
  "summary": "close preview window",
  "mode": "n"
},
{
  "tag": "CTRL-W_bar",
  "char": "CTRL-W |",
  "summary": "set window width to N columns",
  "mode": "n"
},
{
  "tag": "CTRL-W_}",
  "char": "CTRL-W }",
  "summary": "show tag under cursor in preview window",
  "mode": "n"
},
{
  "tag": "CTRL-W_<Down>",
  "char": "CTRL-W <Down>",
  "summary": "same as 'CTRL-W j'",
  "mode": "n"
},
{
  "tag": "CTRL-W_<Up>",
  "char": "CTRL-W <Up>",
  "summary": "same as 'CTRL-W k'",
  "mode": "n"
},
{
  "tag": "CTRL-W_<Left>",
  "char": "CTRL-W <Left>",
  "summary": "same as 'CTRL-W h'",
  "mode": "n"
},
{
  "tag": "CTRL-W_<Right>",
  "char": "CTRL-W <Right>",
  "summary": "same as 'CTRL-W l'",
  "mode": "n"
},
{
  "tag": "[_CTRL-D",
  "char": "[ CTRL-D",
  "summary": "jump to first #define found in current and included files matching the word under the cursor, start searching at beginning of current file",
  "mode": "n"
},
{
  "tag": "[_CTRL-I",
  "char": "[ CTRL-I",
  "summary": "jump to first line in current and included files that contains the word under the cursor, start searching at beginning of current file",
  "mode": "n"
},
{
  "tag": "[#",
  "char": "[#",
  "note": "1",
  "summary": "cursor to N previous unmatched #if, #else or #ifdef",
  "mode": "n"
},
{
  "tag": "['",
  "char": "['",
  "note": "1",
  "summary": "cursor to previous lowercase mark, on first non-blank",
  "mode": "n"
},
{
  "tag": "[(",
  "char": "[(",
  "note": "1",
  "summary": "cursor N times back to unmatched '('",
  "mode": "n"
},
{
  "tag": "[star",
  "char": "[*",
  "note": "1",
  "summary": "same as '[/'",
  "mode": "n"
},
{
  "tag": "[`",
  "char": "[`",
  "note": "1",
  "summary": "cursor to previous lowercase mark",
  "mode": "n"
},
{
  "tag": "[/",
  "char": "[/",
  "note": "1",
  "summary": "cursor to N previous start of a C comment",
  "mode": "n"
},
{
  "tag": "[D",
  "char": "[D",
  "summary": "list all defines found in current and included files matching the word under the cursor, start searching at beginning of current file",
  "mode": "n"
},
{
  "tag": "[I",
  "char": "[I",
  "summary": "list all lines found in current and included files that contain the word under the cursor, start searching at beginning of current file",
  "mode": "n"
},
{
  "tag": "[P",
  "char": "[P",
  "note": "2",
  "summary": "same as '[p'",
  "mode": "n"
},
{
  "tag": "[[",
  "char": "[[",
  "note": "1",
  "summary": "cursor N sections backward",
  "mode": "n"
},
{
  "tag": "[]",
  "char": "[]",
  "note": "1",
  "summary": "cursor N SECTIONS backward",
  "mode": "n"
},
{
  "tag": "[c",
  "char": "[c",
  "note": "1",
  "summary": "cursor N times backwards to start of change",
  "mode": "n"
},
{
  "tag": "[d",
  "char": "[d",
  "summary": "show first #define found in current and included files matching the word under the cursor, start searching at beginning of current file",
  "mode": "n"
},
{
  "tag": "[f",
  "char": "[f",
  "summary": "same as 'gf'",
  "mode": "n"
},
{
  "tag": "[i",
  "char": "[i",
  "summary": "show first line found in current and included files that contains the word under the cursor, start searching at beginning of current file",
  "mode": "n"
},
{
  "tag": "[m",
  "char": "[m",
  "note": "1",
  "summary": "cursor N times back to start of member function",
  "mode": "n"
},
{
  "tag": "[p",
  "char": "[p",
  "note": "2",
  "summary": "like 'P', but adjust indent to current line",
  "mode": "n"
},
{
  "tag": "[s",
  "char": "[s",
  "note": "1",
  "summary": "move to the previous misspelled word",
  "mode": "n"
},
{
  "tag": "[z",
  "char": "[z",
  "note": "1",
  "summary": "move to start of open fold",
  "mode": "n"
},
{
  "tag": "[{",
  "char": "[{",
  "note": "1",
  "summary": "cursor N times back to unmatched '{'",
  "mode": "n"
},
{
  "tag": "[<MiddleMouse>",
  "char": "[<MiddleMouse>",
  "note": "2",
  "summary": "same as '[p'",
  "mode": "n"
},
{
  "tag": "]_CTRL-D",
  "char": "] CTRL-D",
  "summary": "jump to first #define found in current and included files matching the word under the cursor, start searching at cursor position",
  "mode": "n"
},
{
  "tag": "]_CTRL-I",
  "char": "] CTRL-I",
  "summary": "jump to first line in current and included files that contains the word under the cursor, start searching at cursor position",
  "mode": "n"
},
{
  "tag": "]#",
  "char": "]#",
  "note": "1",
  "summary": "cursor to N next unmatched #endif or #else",
  "mode": "n"
},
{
  "tag": "]'",
  "char": "]'",
  "note": "1",
  "summary": "cursor to next lowercase mark, on first non-blank",
  "mode": "n"
},
{
  "tag": "])",
  "char": "])",
  "note": "1",
  "summary": "cursor N times forward to unmatched ')'",
  "mode": "n"
},
{
  "tag": "]star",
  "char": "]*",
  "note": "1",
  "summary": "same as ']/'",
  "mode": "n"
},
{
  "tag": "]`",
  "char": "]`",
  "note": "1",
  "summary": "cursor to next lowercase mark",
  "mode": "n"
},
{
  "tag": "]/",
  "char": "]/",
  "note": "1",
  "summary": "cursor to N next end of a C comment",
  "mode": "n"
},
{
  "tag": "]D",
  "char": "]D",
  "summary": "list all #defines found in current and included files matching the word under the cursor, start searching at cursor position",
  "mode": "n"
},
{
  "tag": "]I",
  "char": "]I",
  "summary": "list all lines found in current and included files that contain the word under the cursor, start searching at cursor position",
  "mode": "n"
},
{
  "tag": "]P",
  "char": "]P",
  "note": "2",
  "summary": "same as '[p'",
  "mode": "n"
},
{
  "tag": "][",
  "char": "][",
  "note": "1",
  "summary": "cursor N SECTIONS forward",
  "mode": "n"
},
{
  "tag": "]]",
  "char": "]]",
  "note": "1",
  "summary": "cursor N sections forward",
  "mode": "n"
},
{
  "tag": "]c",
  "char": "]c",
  "note": "1",
  "summary": "cursor N times forward to start of change",
  "mode": "n"
},
{
  "tag": "]d",
  "char": "]d",
  "summary": "show first #define found in current and included files matching the word under the cursor, start searching at cursor position",
  "mode": "n"
},
{
  "tag": "]f",
  "char": "]f",
  "summary": "same as 'gf'",
  "mode": "n"
},
{
  "tag": "]i",
  "char": "]i",
  "summary": "show first line found in current and included files that contains the word under the cursor, start searching at cursor position",
  "mode": "n"
},
{
  "tag": "]m",
  "char": "]m",
  "note": "1",
  "summary": "cursor N times forward to end of member function",
  "mode": "n"
},
{
  "tag": "]p",
  "char": "]p",
  "note": "2",
  "summary": "like 'p', but adjust indent to current line",
  "mode": "n"
},
{
  "tag": "]s",
  "char": "]s",
  "note": "1",
  "summary": "move to next misspelled word",
  "mode": "n"
},
{
  "tag": "]z",
  "char": "]z",
  "note": "1",
  "summary": "move to end of open fold",
  "mode": "n"
},
{
  "tag": "]}",
  "char": "]}",
  "note": "1",
  "summary": "cursor N times forward to unmatched '}'",
  "mode": "n"
},
{
  "tag": "]<MiddleMouse>",
  "char": "]<MiddleMouse>",
  "note": "2",
  "summary": "same as ']p'",
  "mode": "n"
},
{
  "tag": "g_CTRL-A",
  "char": "g CTRL-A",
  "summary": "dump a memory profile",
  "mode": "n"
},
{
  "tag": "g_CTRL-G",
  "char": "g CTRL-G",
  "summary": "show information about current cursor position",
  "mode": "n"
},
{
  "tag": "g_CTRL-H",
  "char": "g CTRL-H",
  "summary": "start Select block mode",
  "mode": "n"
},
{
  "tag": "g_CTRL-]",
  "char": "g CTRL-]",
  "summary": "|:tjump| to the tag under the cursor",
  "mode": "n"
},
{
  "tag": "g#",
  "char": "g#",
  "note": "1",
  "summary": "like '#', but without using '\\<' and '\\>'",
  "mode": "n"
},
{
  "tag": "g$",
  "char": "g$",
  "note": "1",
  "summary": "when 'wrap' off go to rightmost character of the current line that is on the screen; when 'wrap' on go to the rightmost character of the current screen line",
  "mode": "n"
},
{
  "tag": "g&",
  "char": "g&",
  "note": "2",
  "summary": "repeat last ':s' on all lines",
  "mode": "n"
},
{
  "tag": "g'",
  "char": "g'{mark}",
  "note": "1",
  "summary": "like |'| but without changing the jumplist",
  "mode": "n"
},
{
  "tag": "g`",
  "char": "g`{mark}",
  "note": "1",
  "summary": "like |`| but without changing the jumplist",
  "mode": "n"
},
{
  "tag": "gstar",
  "char": "g*",
  "note": "1",
  "summary": "like '*', but without using '\\<' and '\\>'",
  "mode": "n"
},
{
  "tag": "g+",
  "char": "g+",
  "summary": "go to newer text state N times",
  "mode": "n"
},
{
  "tag": "g,",
  "char": "g,",
  "note": "1",
  "summary": "go to N newer position in change list",
  "mode": "n"
},
{
  "tag": "g-",
  "char": "g-",
  "summary": "go to older text state N times",
  "mode": "n"
},
{
  "tag": "g0",
  "char": "g0",
  "note": "1",
  "summary": "when 'wrap' off go to leftmost character of the current line that is on the screen; when 'wrap' on go to the leftmost character of the current screen line",
  "mode": "n"
},
{
  "tag": "g8",
  "char": "g8",
  "summary": "print hex value of bytes used in UTF-8 character under the cursor",
  "mode": "n"
},
{
  "tag": "g;",
  "char": "g;",
  "note": "1",
  "summary": "go to N older position in change list",
  "mode": "n"
},
{
  "tag": "g<",
  "char": "g<",
  "summary": "display previous command output",
  "mode": "n"
},
{
  "tag": "g?",
  "char": "g?",
  "note": "2",
  "summary": "Rot13 encoding operator",
  "mode": "n"
},
{
  "tag": "g?g?",
  "char": "g??",
  "note": "2",
  "summary": "Rot13 encode current line",
  "mode": "n"
},
{
  "tag": "g?g?",
  "char": "g?g?",
  "note": "2",
  "summary": "Rot13 encode current line",
  "mode": "n"
},
{
  "tag": "gD",
  "char": "gD",
  "note": "1",
  "summary": "go to definition of word under the cursor in current file",
  "mode": "n"
},
{
  "tag": "gE",
  "char": "gE",
  "note": "1",
  "summary": "go backwards to the end of the previous WORD",
  "mode": "n"
},
{
  "tag": "gH",
  "char": "gH",
  "summary": "start Select line mode",
  "mode": "n"
},
{
  "tag": "gI",
  "char": "gI",
  "note": "2",
  "summary": "like 'I', but always start in column 1",
  "mode": "n"
},
{
  "tag": "gJ",
  "char": "gJ",
  "note": "2",
  "summary": "join lines without inserting space",
  "mode": "n"
},
{
  "tag": "gN",
  "char": "gN",
  "note": "1,2",
  "summary": "find the previous match with the last used search pattern and Visually select it",
  "mode": "n"
},
{
  "tag": "gP",
  "char": "[\"x]gP",
  "note": "2",
  "summary": "put the text [from register x] before the cursor N times, leave the cursor after it",
  "mode": "n"
},
{
  "tag": "gQ",
  "char": "gQ",
  "summary": "switch to Ex mode with Vim editing",
  "mode": "n"
},
{
  "tag": "gR",
  "char": "gR",
  "note": "2",
  "summary": "enter Virtual Replace mode",
  "mode": "n"
},
{
  "tag": "gT",
  "char": "gT",
  "summary": "go to the previous tab page",
  "mode": "n"
},
{
  "tag": "gU",
  "char": "gU{motion}",
  "note": "2",
  "summary": "make Nmove text uppercase",
  "mode": "n"
},
{
  "tag": "gV",
  "char": "gV",
  "summary": "don't reselect the previous Visual area when executing a mapping or menu in Select mode",
  "mode": "n"
},
{
  "tag": "g]",
  "char": "g]",
  "summary": ":tselect on the tag under the cursor",
  "mode": "n"
},
{
  "tag": "g^",
  "char": "g^",
  "note": "1",
  "summary": "when 'wrap' off go to leftmost non-white character of the current line that is on the screen; when 'wrap' on go to the leftmost non-white character of the current screen line",
  "mode": "n"
},
{
  "tag": "g_",
  "char": "g_",
  "note": "1",
  "summary": "cursor to the last CHAR N - 1 lines lower",
  "mode": "n"
},
{
  "tag": "ga",
  "char": "ga",
  "summary": "print ascii value of character under the cursor",
  "mode": "n"
},
{
  "tag": "gd",
  "char": "gd",
  "note": "1",
  "summary": "go to definition of word under the cursor in current function",
  "mode": "n"
},
{
  "tag": "ge",
  "char": "ge",
  "note": "1",
  "summary": "go backwards to the end of the previous word",
  "mode": "n"
},
{
  "tag": "gf",
  "char": "gf",
  "summary": "start editing the file whose name is under the cursor",
  "mode": "n"
},
{
  "tag": "gF",
  "char": "gF",
  "summary": "start editing the file whose name is under the cursor and jump to the line number following the filename.",
  "mode": "n"
},
{
  "tag": "gg",
  "char": "gg",
  "note": "1",
  "summary": "cursor to line N, default first line",
  "mode": "n"
},
{
  "tag": "gh",
  "char": "gh",
  "summary": "start Select mode",
  "mode": "n"
},
{
  "tag": "gi",
  "char": "gi",
  "note": "2",
  "summary": "like 'i', but first move to the |'^| mark",
  "mode": "n"
},
{
  "tag": "gj",
  "char": "gj",
  "note": "1",
  "summary": "like 'j', but when 'wrap' on go N screen lines down",
  "mode": "n"
},
{
  "tag": "gk",
  "char": "gk",
  "note": "1",
  "summary": "like 'k', but when 'wrap' on go N screen lines up",
  "mode": "n"
},
{
  "tag": "gm",
  "char": "gm",
  "note": "1",
  "summary": "go to character at middle of the screenline",
  "mode": "n"
},
{
  "tag": "gM",
  "char": "gM",
  "note": "1",
  "summary": "go to character at middle of the text line",
  "mode": "n"
},
{
  "tag": "gn",
  "char": "gn",
  "note": "1,2",
  "summary": "find the next match with the last used search pattern and Visually select it",
  "mode": "n"
},
{
  "tag": "go",
  "char": "go",
  "note": "1",
  "summary": "cursor to byte N in the buffer",
  "mode": "n"
},
{
  "tag": "gp",
  "char": "[\"x]gp",
  "note": "2",
  "summary": "put the text [from register x] after the cursor N times, leave the cursor after it",
  "mode": "n"
},
{
  "tag": "gq",
  "char": "gq{motion}",
  "note": "2",
  "summary": "format Nmove text",
  "mode": "n"
},
{
  "tag": "gr",
  "char": "gr{char}",
  "note": "2",
  "summary": "virtual replace N chars with {char}",
  "mode": "n"
},
{
  "tag": "gs",
  "char": "gs",
  "summary": "go to sleep for N seconds (default 1)",
  "mode": "n"
},
{
  "tag": "gt",
  "char": "gt",
  "summary": "go to the next tab page",
  "mode": "n"
},
{
  "tag": "gu",
  "char": "gu{motion}",
  "note": "2",
  "summary": "make Nmove text lowercase",
  "mode": "n"
},
{
  "tag": "gv",
  "char": "gv",
  "summary": "reselect the previous Visual area",
  "mode": "n"
},
{
  "tag": "gw",
  "char": "gw{motion}",
  "note": "2",
  "summary": "format Nmove text and keep cursor",
  "mode": "n"
},
{
  "tag": "netrw-gx",
  "char": "gx",
  "summary": "execute application for file name under the cursor (only with |netrw| plugin)",
  "mode": "n"
},
{
  "tag": "g@",
  "char": "g@{motion}",
  "summary": "call 'operatorfunc'",
  "mode": "n"
},
{
  "tag": "g~",
  "char": "g~{motion}",
  "note": "2",
  "summary": "swap case for Nmove text",
  "mode": "n"
},
{
  "tag": "g<Down>",
  "char": "g<Down>",
  "note": "1",
  "summary": "same as 'gj'",
  "mode": "n"
},
{
  "tag": "g<End>",
  "char": "g<End>",
  "note": "1",
  "summary": "same as 'g$'",
  "mode": "n"
},
{
  "tag": "g<Home>",
  "char": "g<Home>",
  "note": "1",
  "summary": "same as 'g0'",
  "mode": "n"
},
{
  "tag": "g<LeftMouse>",
  "char": "g<LeftMouse>",
  "summary": "same as <C-LeftMouse>",
  "mode": "n"
},
{
  "tag": "<NONE>",
  "char": "g<MiddleMouse>",
  "summary": "same as <C-MiddleMouse>",
  "mode": "n"
},
{
  "tag": "g<RightMouse>",
  "char": "g<RightMouse>",
  "summary": "same as <C-RightMouse>",
  "mode": "n"
},
{
  "tag": "g<Tab>",
  "char": "g<Tab>",
  "summary": "go to last accessed tab page",
  "mode": "n"
},
{
  "tag": "g<Up>",
  "char": "g<Up>",
  "note": "1",
  "summary": "same as 'gk'",
  "mode": "n"
},
{
  "tag": "z<CR>",
  "char": "z<CR>",
  "summary": "redraw, cursor line to top of window, cursor on first non-blank",
  "mode": "n"
},
{
  "tag": "zN<CR>",
  "char": "z{height}<CR>",
  "summary": "redraw, make window {height} lines high",
  "mode": "n"
},
{
  "tag": "z+",
  "char": "z+",
  "summary": "cursor on line N (default line below window), otherwise like 'z<CR>'",
  "mode": "n"
},
{
  "tag": "z-",
  "char": "z-",
  "summary": "redraw, cursor line at bottom of window, cursor on first non-blank",
  "mode": "n"
},
{
  "tag": "z.",
  "char": "z.",
  "summary": "redraw, cursor line to center of window, cursor on first non-blank",
  "mode": "n"
},
{
  "tag": "z=",
  "char": "z=",
  "summary": "give spelling suggestions",
  "mode": "n"
},
{
  "tag": "zA",
  "char": "zA",
  "summary": "open a closed fold or close an open fold recursively",
  "mode": "n"
},
{
  "tag": "zC",
  "char": "zC",
  "summary": "close folds recursively",
  "mode": "n"
},
{
  "tag": "zD",
  "char": "zD",
  "summary": "delete folds recursively",
  "mode": "n"
},
{
  "tag": "zE",
  "char": "zE",
  "summary": "eliminate all folds",
  "mode": "n"
},
{
  "tag": "zF",
  "char": "zF",
  "summary": "create a fold for N lines",
  "mode": "n"
},
{
  "tag": "zG",
  "char": "zG",
  "summary": "temporarily mark word as correctly spelled",
  "mode": "n"
},
{
  "tag": "zH",
  "char": "zH",
  "summary": "when 'wrap' off scroll half a screenwidth to the right",
  "mode": "n"
},
{
  "tag": "zL",
  "char": "zL",
  "summary": "when 'wrap' off scroll half a screenwidth to the left",
  "mode": "n"
},
{
  "tag": "zM",
  "char": "zM",
  "summary": "set 'foldlevel' to zero",
  "mode": "n"
},
{
  "tag": "zN",
  "char": "zN",
  "summary": "set 'foldenable'",
  "mode": "n"
},
{
  "tag": "zO",
  "char": "zO",
  "summary": "open folds recursively",
  "mode": "n"
},
{
  "tag": "zR",
  "char": "zR",
  "summary": "set 'foldlevel' to the deepest fold",
  "mode": "n"
},
{
  "tag": "zW",
  "char": "zW",
  "summary": "temporarily mark word as incorrectly spelled",
  "mode": "n"
},
{
  "tag": "zX",
  "char": "zX",
  "summary": "re-apply 'foldlevel'",
  "mode": "n"
},
{
  "tag": "z^",
  "char": "z^",
  "summary": "cursor on line N (default line above window), otherwise like 'z-'",
  "mode": "n"
},
{
  "tag": "za",
  "char": "za",
  "summary": "open a closed fold, close an open fold",
  "mode": "n"
},
{
  "tag": "zb",
  "char": "zb",
  "summary": "redraw, cursor line at bottom of window",
  "mode": "n"
},
{
  "tag": "zc",
  "char": "zc",
  "summary": "close a fold",
  "mode": "n"
},
{
  "tag": "zd",
  "char": "zd",
  "summary": "delete a fold",
  "mode": "n"
},
{
  "tag": "ze",
  "char": "ze",
  "summary": "when 'wrap' off scroll horizontally to position the cursor at the end (right side) of the screen",
  "mode": "n"
},
{
  "tag": "zf",
  "char": "zf{motion}",
  "summary": "create a fold for Nmove text",
  "mode": "n"
},
{
  "tag": "zg",
  "char": "zg",
  "summary": "permanently mark word as correctly spelled",
  "mode": "n"
},
{
  "tag": "zh",
  "char": "zh",
  "summary": "when 'wrap' off scroll screen N characters to the right",
  "mode": "n"
},
{
  "tag": "zi",
  "char": "zi",
  "summary": "toggle 'foldenable'",
  "mode": "n"
},
{
  "tag": "zj",
  "char": "zj",
  "note": "1",
  "summary": "move to the start of the next fold",
  "mode": "n"
},
{
  "tag": "zk",
  "char": "zk",
  "note": "1",
  "summary": "move to the end of the previous fold",
  "mode": "n"
},
{
  "tag": "zl",
  "char": "zl",
  "summary": "when 'wrap' off scroll screen N characters to the left",
  "mode": "n"
},
{
  "tag": "zm",
  "char": "zm",
  "summary": "subtract one from 'foldlevel'",
  "mode": "n"
},
{
  "tag": "zn",
  "char": "zn",
  "summary": "reset 'foldenable'",
  "mode": "n"
},
{
  "tag": "zo",
  "char": "zo",
  "summary": "open fold",
  "mode": "n"
},
{
  "tag": "zp",
  "char": "zp",
  "summary": "paste in block-mode without trailing spaces",
  "mode": "n"
},
{
  "tag": "zP",
  "char": "zP",
  "summary": "paste in block-mode without trailing spaces",
  "mode": "n"
},
{
  "tag": "zr",
  "char": "zr",
  "summary": "add one to 'foldlevel'",
  "mode": "n"
},
{
  "tag": "zs",
  "char": "zs",
  "summary": "when 'wrap' off scroll horizontally to position the cursor at the start (left side) of the screen",
  "mode": "n"
},
{
  "tag": "zt",
  "char": "zt",
  "summary": "redraw, cursor line at top of window",
  "mode": "n"
},
{
  "tag": "zuw",
  "char": "zuw",
  "summary": "undo |zw|",
  "mode": "n"
},
{
  "tag": "zug",
  "char": "zug",
  "summary": "undo |zg|",
  "mode": "n"
},
{
  "tag": "zuW",
  "char": "zuW",
  "summary": "undo |zW|",
  "mode": "n"
},
{
  "tag": "zuG",
  "char": "zuG",
  "summary": "undo |zG|",
  "mode": "n"
},
{
  "tag": "zv",
  "char": "zv",
  "summary": "open enough folds to view the cursor line",
  "mode": "n"
},
{
  "tag": "zw",
  "char": "zw",
  "summary": "permanently mark word as incorrectly spelled",
  "mode": "n"
},
{
  "tag": "zx",
  "char": "zx",
  "summary": "re-apply 'foldlevel' and do 'zv'",
  "mode": "n"
},
{
  "tag": "zy",
  "char": "zy",
  "summary": "yank without trailing spaces",
  "mode": "n"
},
{
  "tag": "zz",
  "char": "zz",
  "summary": "redraw, cursor line at center of window",
  "mode": "n"
},
{
  "tag": "z<Left>",
  "char": "z<Left>",
  "summary": "same as 'zh'",
  "mode": "n"
},
{
  "tag": "z<Right>",
  "char": "z<Right>",
  "summary": "same as 'zl'",
  "mode": "n"
},
{
  "tag": "o_v",
  "char": "v",
  "summary": "force operator to work charwise",
  "mode": "o"
},
{
  "tag": "o_V",
  "char": "V",
  "summary": "force operator to work linewise",
  "mode": "o"
},
{
  "tag": "o_CTRL-V",
  "char": "CTRL-V",
  "summary": "force operator to work blockwise",
  "mode": "o"
},
{
  "tag": "v_CTRL-\\_CTRL-N",
  "char": "CTRL-\\ CTRL-N",
  "summary": "stop Visual mode",
  "mode": "v"
},
{
  "tag": "v_CTRL-\\_CTRL-G",
  "char": "CTRL-\\ CTRL-G",
  "summary": "go to Normal mode",
  "mode": "v"
},
{
  "tag": "v_CTRL-A",
  "char": "CTRL-A",
  "note": "2",
  "summary": "add N to number in highlighted text",
  "mode": "v"
},
{
  "tag": "v_CTRL-C",
  "char": "CTRL-C",
  "summary": "stop Visual mode",
  "mode": "v"
},
{
  "tag": "v_CTRL-G",
  "char": "CTRL-G",
  "summary": "toggle between Visual mode and Select mode",
  "mode": "v"
},
{
  "tag": "v_<BS>",
  "char": "<BS>",
  "note": "2",
  "summary": "Select mode: delete highlighted area",
  "mode": "v"
},
{
  "tag": "v_CTRL-H",
  "char": "CTRL-H",
  "note": "2",
  "summary": "same as <BS>",
  "mode": "v"
},
{
  "tag": "v_CTRL-O",
  "char": "CTRL-O",
  "summary": "switch from Select to Visual mode for one command",
  "mode": "v"
},
{
  "tag": "v_CTRL-V",
  "char": "CTRL-V",
  "summary": "make Visual mode blockwise or stop Visual mode",
  "mode": "v"
},
{
  "tag": "v_CTRL-X",
  "char": "CTRL-X",
  "note": "2",
  "summary": "subtract N from number in highlighted text",
  "mode": "v"
},
{
  "tag": "v_<Esc>",
  "char": "<Esc>",
  "summary": "stop Visual mode",
  "mode": "v"
},
{
  "tag": "v_CTRL-]",
  "char": "CTRL-]",
  "summary": "jump to highlighted tag",
  "mode": "v"
},
{
  "tag": "v_!",
  "char": "!{filter}",
  "note": "2",
  "summary": "filter the highlighted lines through the external command {filter}",
  "mode": "v"
},
{
  "tag": "v_:",
  "char": ":",
  "summary": "start a command-line with the highlighted lines as a range",
  "mode": "v"
},
{
  "tag": "v_<",
  "char": "<",
  "note": "2",
  "summary": "shift the highlighted lines one 'shiftwidth' left",
  "mode": "v"
},
{
  "tag": "v_=",
  "char": "=",
  "note": "2",
  "summary": "filter the highlighted lines through the external program given with the 'equalprg' option",
  "mode": "v"
},
{
  "tag": "v_>",
  "char": ">",
  "note": "2",
  "summary": "shift the highlighted lines one 'shiftwidth' right",
  "mode": "v"
},
{
  "tag": "v_b_A",
  "char": "A",
  "note": "2",
  "summary": "block mode: append same text in all lines, after the highlighted area",
  "mode": "v"
},
{
  "tag": "v_C",
  "char": "C",
  "note": "2",
  "summary": "delete the highlighted lines and start insert",
  "mode": "v"
},
{
  "tag": "v_D",
  "char": "D",
  "note": "2",
  "summary": "delete the highlighted lines",
  "mode": "v"
},
{
  "tag": "v_b_I",
  "char": "I",
  "note": "2",
  "summary": "block mode: insert same text in all lines, before the highlighted area",
  "mode": "v"
},
{
  "tag": "v_J",
  "char": "J",
  "note": "2",
  "summary": "join the highlighted lines",
  "mode": "v"
},
{
  "tag": "v_K",
  "char": "K",
  "summary": "run 'keywordprg' on the highlighted area",
  "mode": "v"
},
{
  "tag": "v_O",
  "char": "O",
  "summary": "move horizontally to other corner of area",
  "mode": "v"
},
{
  "tag": "v_P",
  "char": "P",
  "summary": "replace highlighted area with register contents; registers are unchanged",
  "mode": "v"
},
{
  "tag": "<NONE>",
  "char": "Q",
  "summary": "does not start Ex mode",
  "mode": "v"
},
{
  "tag": "v_R",
  "char": "R",
  "note": "2",
  "summary": "delete the highlighted lines and start insert",
  "mode": "v"
},
{
  "tag": "v_S",
  "char": "S",
  "note": "2",
  "summary": "delete the highlighted lines and start insert",
  "mode": "v"
},
{
  "tag": "v_U",
  "char": "U",
  "note": "2",
  "summary": "make highlighted area uppercase",
  "mode": "v"
},
{
  "tag": "v_V",
  "char": "V",
  "summary": "make Visual mode linewise or stop Visual mode",
  "mode": "v"
},
{
  "tag": "v_X",
  "char": "X",
  "note": "2",
  "summary": "delete the highlighted lines",
  "mode": "v"
},
{
  "tag": "v_Y",
  "char": "Y",
  "summary": "yank the highlighted lines",
  "mode": "v"
},
{
  "tag": "v_aquote",
  "char": "a\"",
  "summary": "extend highlighted area with a double quoted string",
  "mode": "v"
},
{
  "tag": "v_a'",
  "char": "a'",
  "summary": "extend highlighted area with a single quoted string",
  "mode": "v"
},
{
  "tag": "v_a(",
  "char": "a(",
  "summary": "same as ab",
  "mode": "v"
},
{
  "tag": "v_a)",
  "char": "a)",
  "summary": "same as ab",
  "mode": "v"
},
{
  "tag": "v_a<",
  "char": "a<",
  "summary": "extend highlighted area with a <> block",
  "mode": "v"
},
{
  "tag": "v_a>",
  "char": "a>",
  "summary": "same as a<",
  "mode": "v"
},
{
  "tag": "v_aB",
  "char": "aB",
  "summary": "extend highlighted area with a {} block",
  "mode": "v"
},
{
  "tag": "v_aW",
  "char": "aW",
  "summary": "extend highlighted area with 'a WORD'",
  "mode": "v"
},
{
  "tag": "v_a[",
  "char": "a[",
  "summary": "extend highlighted area with a [] block",
  "mode": "v"
},
{
  "tag": "v_a]",
  "char": "a]",
  "summary": "same as a[",
  "mode": "v"
},
{
  "tag": "v_a`",
  "char": "a`",
  "summary": "extend highlighted area with a backtick quoted string",
  "mode": "v"
},
{
  "tag": "v_ab",
  "char": "ab",
  "summary": "extend highlighted area with a () block",
  "mode": "v"
},
{
  "tag": "v_ap",
  "char": "ap",
  "summary": "extend highlighted area with a paragraph",
  "mode": "v"
},
{
  "tag": "v_as",
  "char": "as",
  "summary": "extend highlighted area with a sentence",
  "mode": "v"
},
{
  "tag": "v_at",
  "char": "at",
  "summary": "extend highlighted area with a tag block",
  "mode": "v"
},
{
  "tag": "v_aw",
  "char": "aw",
  "summary": "extend highlighted area with 'a word'",
  "mode": "v"
},
{
  "tag": "v_a{",
  "char": "a{",
  "summary": "same as aB",
  "mode": "v"
},
{
  "tag": "v_a}",
  "char": "a}",
  "summary": "same as aB",
  "mode": "v"
},
{
  "tag": "v_c",
  "char": "c",
  "note": "2",
  "summary": "delete highlighted area and start insert",
  "mode": "v"
},
{
  "tag": "v_d",
  "char": "d",
  "note": "2",
  "summary": "delete highlighted area",
  "mode": "v"
},
{
  "tag": "v_g_CTRL-A",
  "char": "g CTRL-A",
  "note": "2",
  "summary": "add N to number in highlighted text",
  "mode": "v"
},
{
  "tag": "v_g_CTRL-X",
  "char": "g CTRL-X",
  "note": "2",
  "summary": "subtract N from number in highlighted text",
  "mode": "v"
},
{
  "tag": "v_gJ",
  "char": "gJ",
  "note": "2",
  "summary": "join the highlighted lines without inserting spaces",
  "mode": "v"
},
{
  "tag": "v_gq",
  "char": "gq",
  "note": "2",
  "summary": "format the highlighted lines",
  "mode": "v"
},
{
  "tag": "v_gv",
  "char": "gv",
  "summary": "exchange current and previous highlighted area",
  "mode": "v"
},
{
  "tag": "v_iquote",
  "char": "i\"",
  "summary": "extend highlighted area with a double quoted string (without quotes)",
  "mode": "v"
},
{
  "tag": "v_i'",
  "char": "i'",
  "summary": "extend highlighted area with a single quoted string (without quotes)",
  "mode": "v"
},
{
  "tag": "v_i(",
  "char": "i(",
  "summary": "same as ib",
  "mode": "v"
},
{
  "tag": "v_i)",
  "char": "i)",
  "summary": "same as ib",
  "mode": "v"
},
{
  "tag": "v_i<",
  "char": "i<",
  "summary": "extend highlighted area with inner <> block",
  "mode": "v"
},
{
  "tag": "v_i>",
  "char": "i>",
  "summary": "same as i<",
  "mode": "v"
},
{
  "tag": "v_iB",
  "char": "iB",
  "summary": "extend highlighted area with inner {} block",
  "mode": "v"
},
{
  "tag": "v_iW",
  "char": "iW",
  "summary": "extend highlighted area with 'inner WORD'",
  "mode": "v"
},
{
  "tag": "v_i[",
  "char": "i[",
  "summary": "extend highlighted area with inner [] block",
  "mode": "v"
},
{
  "tag": "v_i]",
  "char": "i]",
  "summary": "same as i[",
  "mode": "v"
},
{
  "tag": "v_i`",
  "char": "i`",
  "summary": "extend highlighted area with a backtick quoted string (without the backticks)",
  "mode": "v"
},
{
  "tag": "v_ib",
  "char": "ib",
  "summary": "extend highlighted area with inner () block",
  "mode": "v"
},
{
  "tag": "v_ip",
  "char": "ip",
  "summary": "extend highlighted area with inner paragraph",
  "mode": "v"
},
{
  "tag": "v_is",
  "char": "is",
  "summary": "extend highlighted area with inner sentence",
  "mode": "v"
},
{
  "tag": "v_it",
  "char": "it",
  "summary": "extend highlighted area with inner tag block",
  "mode": "v"
},
{
  "tag": "v_iw",
  "char": "iw",
  "summary": "extend highlighted area with 'inner word'",
  "mode": "v"
},
{
  "tag": "v_i{",
  "char": "i{",
  "summary": "same as iB",
  "mode": "v"
},
{
  "tag": "v_i}",
  "char": "i}",
  "summary": "same as iB",
  "mode": "v"
},
{
  "tag": "v_o",
  "char": "o",
  "summary": "move cursor to other corner of area",
  "mode": "v"
},
{
  "tag": "v_p",
  "char": "p",
  "summary": "replace highlighted area with register contents; deleted text in unnamed register",
  "mode": "v"
},
{
  "tag": "v_r",
  "char": "r",
  "note": "2",
  "summary": "replace highlighted area with a character",
  "mode": "v"
},
{
  "tag": "v_s",
  "char": "s",
  "note": "2",
  "summary": "delete highlighted area and start insert",
  "mode": "v"
},
{
  "tag": "v_u",
  "char": "u",
  "note": "2",
  "summary": "make highlighted area lowercase",
  "mode": "v"
},
{
  "tag": "v_v",
  "char": "v",
  "summary": "make Visual mode charwise or stop Visual mode",
  "mode": "v"
},
{
  "tag": "v_x",
  "char": "x",
  "note": "2",
  "summary": "delete the highlighted area",
  "mode": "v"
},
{
  "tag": "v_y",
  "char": "y",
  "summary": "yank the highlighted area",
  "mode": "v"
},
{
  "tag": "v_~",
  "char": "~",
  "note": "2",
  "summary": "swap case for the highlighted area",
  "mode": "v"
},
{
  "tag": "<NONE>",
  "char": "CTRL-@",
  "summary": "not used",
  "mode": "c"
},
{
  "tag": "c_CTRL-A",
  "char": "CTRL-A",
  "summary": "do completion on the pattern in front of the cursor and insert all matches",
  "mode": "c"
},
{
  "tag": "c_CTRL-B",
  "char": "CTRL-B",
  "summary": "cursor to begin of command-line",
  "mode": "c"
},
{
  "tag": "c_CTRL-C",
  "char": "CTRL-C",
  "summary": "same as <Esc>",
  "mode": "c"
},
{
  "tag": "c_CTRL-D",
  "char": "CTRL-D",
  "summary": "list completions that match the pattern in front of the cursor",
  "mode": "c"
},
{
  "tag": "c_CTRL-E",
  "char": "CTRL-E",
  "summary": "cursor to end of command-line",
  "mode": "c"
},
{
  "tag": "'cedit'",
  "char": "CTRL-F",
  "summary": "default value for 'cedit': opens the command-line window; otherwise not used",
  "mode": "c"
},
{
  "tag": "c_CTRL-G",
  "char": "CTRL-G",
  "summary": "next match when 'incsearch' is active",
  "mode": "c"
},
{
  "tag": "c_<BS>",
  "char": "<BS>",
  "summary": "delete the character in front of the cursor",
  "mode": "c"
},
{
  "tag": "c_digraph",
  "char": "{char1} <BS> {char2}",
  "summary": "enter digraph when 'digraph' is on",
  "mode": "c"
},
{
  "tag": "c_CTRL-H",
  "char": "CTRL-H",
  "summary": "same as <BS>",
  "mode": "c"
},
{
  "tag": "c_<Tab>",
  "char": "<Tab>",
  "summary": "if 'wildchar' is <Tab>: Do completion on the pattern in front of the cursor",
  "mode": "c"
},
{
  "tag": "c_<S-Tab>",
  "char": "<S-Tab>",
  "summary": "same as CTRL-P",
  "mode": "c"
},
{
  "tag": "c_wildchar",
  "char": "'wildchar'",
  "summary": "Do completion on the pattern in front of the cursor (default: <Tab>)",
  "mode": "c"
},
{
  "tag": "c_CTRL-I",
  "char": "CTRL-I",
  "summary": "same as <Tab>",
  "mode": "c"
},
{
  "tag": "c_<NL>",
  "char": "<NL>",
  "summary": "same as <CR>",
  "mode": "c"
},
{
  "tag": "c_CTRL-J",
  "char": "CTRL-J",
  "summary": "same as <CR>",
  "mode": "c"
},
{
  "tag": "c_CTRL-K",
  "char": "CTRL-K {char1} {char2}",
  "summary": "enter digraph",
  "mode": "c"
},
{
  "tag": "c_CTRL-L",
  "char": "CTRL-L",
  "summary": "do completion on the pattern in front of the cursor and insert the longest common part",
  "mode": "c"
},
{
  "tag": "c_<CR>",
  "char": "<CR>",
  "summary": "execute entered command",
  "mode": "c"
},
{
  "tag": "c_CTRL-M",
  "char": "CTRL-M",
  "summary": "same as <CR>",
  "mode": "c"
},
{
  "tag": "c_CTRL-N",
  "char": "CTRL-N",
  "summary": "after using 'wildchar' with multiple matches: go to next match, otherwise: recall older command-line from history.",
  "mode": "c"
},
{
  "tag": "<NONE>",
  "char": "CTRL-O",
  "summary": "not used",
  "mode": "c"
},
{
  "tag": "c_CTRL-P",
  "char": "CTRL-P",
  "summary": "after using 'wildchar' with multiple matches: go to previous match, otherwise: recall older command-line from history.",
  "mode": "c"
},
{
  "tag": "c_CTRL-Q",
  "char": "CTRL-Q",
  "summary": "same as CTRL-V, unless it's used for terminal control flow",
  "mode": "c"
},
{
  "tag": "c_CTRL-R",
  "char": "CTRL-R {regname}",
  "summary": "insert the contents of a register or object under the cursor as if typed",
  "mode": "c"
},
{
  "tag": "c_CTRL-R_CTRL-R",
  "char": "CTRL-R CTRL-R {regname}",
  "summary": "insert the contents of a register or object under the cursor literally",
  "mode": "c"
},
{
  "tag": "c_CTRL-R_CTRL-O",
  "char": "CTRL-R CTRL-O {regname}",
  "summary": "insert the contents of a register or object under the cursor literally",
  "mode": "c"
},
{
  "tag": "<NONE>",
  "char": "CTRL-S",
  "summary": "not used, or used for terminal control flow",
  "mode": "c"
},
{
  "tag": "c_CTRL-T",
  "char": "CTRL-T",
  "summary": "previous match when 'incsearch' is active",
  "mode": "c"
},
{
  "tag": "c_CTRL-U",
  "char": "CTRL-U",
  "summary": "remove all characters",
  "mode": "c"
},
{
  "tag": "c_CTRL-V",
  "char": "CTRL-V",
  "summary": "insert next non-digit literally, insert three digit decimal number as a single byte.",
  "mode": "c"
},
{
  "tag": "c_CTRL-W",
  "char": "CTRL-W",
  "summary": "delete the word in front of the cursor",
  "mode": "c"
},
{
  "tag": "<NONE>",
  "char": "CTRL-X",
  "summary": "not used (reserved for completion)",
  "mode": "c"
},
{
  "tag": "<NONE>",
  "char": "CTRL-Y",
  "summary": "copy (yank) modeless selection",
  "mode": "c"
},
{
  "tag": "<NONE>",
  "char": "CTRL-Z",
  "summary": "not used (reserved for suspend)",
  "mode": "c"
},
{
  "tag": "c_<Esc>",
  "char": "<Esc>",
  "summary": "abandon command-line without executing it",
  "mode": "c"
},
{
  "tag": "c_CTRL-[",
  "char": "CTRL-[",
  "summary": "same as <Esc>",
  "mode": "c"
},
{
  "tag": "c_CTRL-\\_CTRL-N",
  "char": "CTRL-\\ CTRL-N",
  "summary": "go to Normal mode, abandon command-line",
  "mode": "c"
},
{
  "tag": "c_CTRL-\\_CTRL-G",
  "char": "CTRL-\\ CTRL-G",
  "summary": "go to Normal mode, abandon command-line",
  "mode": "c"
},
{
  "tag": "<NONE>",
  "char": "CTRL-\\ a - d",
  "summary": "reserved for extensions",
  "mode": "c"
},
{
  "tag": "c_CTRL-\\_e",
  "char": "CTRL-\\ e {expr}",
  "summary": "replace the command line with the result of {expr}",
  "mode": "c"
},
{
  "tag": "<NONE>",
  "char": "CTRL-\\ f - z",
  "summary": "reserved for extensions",
  "mode": "c"
},
{
  "tag": "<NONE>",
  "char": "CTRL-\\ others",
  "summary": "not used",
  "mode": "c"
},
{
  "tag": "c_CTRL-]",
  "char": "CTRL-]",
  "summary": "trigger abbreviation",
  "mode": "c"
},
{
  "tag": "c_CTRL-^",
  "char": "CTRL-^",
  "summary": "toggle use of |:lmap| mappings",
  "mode": "c"
},
{
  "tag": "c_CTRL-_",
  "char": "CTRL-_",
  "summary": "when 'allowrevins' set: change language (Hebrew)",
  "mode": "c"
},
{
  "tag": "c_<Del>",
  "char": "<Del>",
  "summary": "delete the character under the cursor",
  "mode": "c"
},
{
  "tag": "c_<Left>",
  "char": "<Left>",
  "summary": "cursor left",
  "mode": "c"
},
{
  "tag": "c_<S-Left>",
  "char": "<S-Left>",
  "summary": "cursor one word left",
  "mode": "c"
},
{
  "tag": "c_<C-Left>",
  "char": "<C-Left>",
  "summary": "cursor one word left",
  "mode": "c"
},
{
  "tag": "c_<Right>",
  "char": "<Right>",
  "summary": "cursor right",
  "mode": "c"
},
{
  "tag": "c_<S-Right>",
  "char": "<S-Right>",
  "summary": "cursor one word right",
  "mode": "c"
},
{
  "tag": "c_<C-Right>",
  "char": "<C-Right>",
  "summary": "cursor one word right",
  "mode": "c"
},
{
  "tag": "c_<Up>",
  "char": "<Up>",
  "summary": "recall previous command-line from history that matches pattern in front of the cursor",
  "mode": "c"
},
{
  "tag": "c_<S-Up>",
  "char": "<S-Up>",
  "summary": "recall previous command-line from history",
  "mode": "c"
},
{
  "tag": "c_<Down>",
  "char": "<Down>",
  "summary": "recall next command-line from history that matches pattern in front of the cursor",
  "mode": "c"
},
{
  "tag": "c_<S-Down>",
  "char": "<S-Down>",
  "summary": "recall next command-line from history",
  "mode": "c"
},
{
  "tag": "c_<Home>",
  "char": "<Home>",
  "summary": "cursor to start of command-line",
  "mode": "c"
},
{
  "tag": "c_<End>",
  "char": "<End>",
  "summary": "cursor to end of command-line",
  "mode": "c"
},
{
  "tag": "c_<PageDown>",
  "char": "<PageDown>",
  "summary": "same as <S-Down>",
  "mode": "c"
},
{
  "tag": "c_<PageUp>",
  "char": "<PageUp>",
  "summary": "same as <S-Up>",
  "mode": "c"
},
{
  "tag": "c_<Insert>",
  "char": "<Insert>",
  "summary": "toggle insert/overstrike mode",
  "mode": "c"
},
{
  "tag": "c_<LeftMouse>",
  "char": "<LeftMouse>",
  "summary": "cursor at mouse click",
  "mode": "c"
}
]
]==]

return {
  {
    tag = "gg",
    lhs = "gg",
    note = "1",
    summary = "cursor to line N, default first line",
    mode = "n",
    desc = "Go to top of buffer",
  },
  {
    tag = "gh",
    lhs = "gh",
    summary = "start Select mode",
    mode = "n"
  },
  {
    tag = "gi",
    lhs = "gi",
    note = "2",
    summary = "like 'i', but first move to the |'^| mark",
    mode = "n"
  },
}
