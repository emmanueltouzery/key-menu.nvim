# key-menu.nvim

**🚧 This plugin is currently in a beta state. It is usable and I use it as part of my normal, everyday config. But many features are missing and there may be bugs. Bug reports and feature requests are welcome! 🚧**

![demo](https://user-images.githubusercontent.com/5308024/169894329-7e14d3b1-fa9e-4326-92f2-de82d3b0096e.gif)

## Highlights

- Just works. Lightweight and simple. Minimal configuration.
- The hint window pops up next to your cursor, and uses as little screen real estate as possible.
- No custom syntax for creating mappings – just use Neovim's standard, built-in `vim.keymap.set`.

## Setup and usage

Install key-menu.nvim using [vim-plug](https://github.com/junegunn/vim-plug) with `Plug 'linty-org/key-menu.nvim'`, or use your favorite Neovim plugin manager. Requires at least Neovim 0.7.

Sample configuration (in `init.lua`):
```lua
-- This Vim setting controls the delay before the popup appears. The way it
-- works is, if you have mappings for, say, the key "a" and the key sequence
-- "ab", if you type "a", then Vim waits timeoutlen, and if you don't press
-- another key before that amount of time, then the "a" mapping is executed, but
-- if you press "b" before timeoutlen, then the "ab" mapping is executed.
vim.o.timeoutlen = 300

-- If you use <Space> as your mapping prefix, then this will make the key-menu
-- popup appear in Normal mode, after you press <Space>, after timeoutlen.
require 'key-menu'.set('n', '<Space>')

-- Use the desc option to Vim's built-in vim.keymap.set to describe mappings.
vim.keymap.set('n', '<Space>w', '<Cmd>w<CR>', {desc='Save'})
vim.keymap.set('n', '<Space>q', '<Cmd>q<CR>', {desc='Quit'})

-- You can also pass Lua functions to vim.keymap.set.
local erase_all_lines = function()
  vim.api.nvim_buf_set_lines(0, 0, -1, false, {})
end
vim.keymap.set('n', '<Space>k', erase_all_lines, {desc='Erase all'})

-- You can put mappings several keys deep, in a mapping group. For some kinds of
-- mappings, even if you don't include a description, key-menu will try to
-- render them nicely, for example by not showing the <Cmd> and <CR>.
vim.keymap.set('n', '<Space>gs', '<Cmd>Git status<CR>')
vim.keymap.set('n', '<Space>gc', '<Cmd>Git commit<CR>')

-- To describe the group of mappings under <Space>g, use key-menu.set.
require 'key-menu'.set('n', '<Space>g', {desc='Git'})

-- The function key-menu.set is just a thin wrapper around vim.keymap.set, and
-- is provided for convenience so that you don't have to type the key sequence
-- twice. The above call to key-menu.set is equivalent to this:
vim.keymap.set('n', '<Space>g',
  function() require 'key-menu'.open_window('<Space>g') end,
  {desc='Git'})

-- The arguments to key-menu.set are the same as those for vim.keymap.set,
-- except that the RHS/callback argument is omitted.

-- Create a buffer-local mapping group to echo some example text.
require 'key-menu'.set('n', '<Space>s',
  {desc = 'Say something', buffer = true})
-- Create buffer-local mappings to say hello and goodbye.
vim.keymap.set('n', '<Space>sh',
  function() print('Hello, world') end,
  {desc = '...hello!', buffer = true})
vim.keymap.set('n', '<Space>sg',
  function() print('Goodbye, world!') end,
  {desc = '...goodbye!', buffer = true})
```

Final results:

![sample-config-root](https://user-images.githubusercontent.com/5308024/170115903-a10692a8-11b7-4f4b-9194-c958251772fb.png) ![sample-config-git](https://user-images.githubusercontent.com/5308024/170115928-cbd9cb25-eb13-49ee-9fa0-eab22d0f9fe3.png) ![sample-config-say](https://user-images.githubusercontent.com/5308024/170115942-1ab0d108-77e9-47ad-a019-c766fa26965f.png)

## How it works

The easiest way to understand how this plugin works is to run the following command interactively in Neovim:
```
:lua require 'key-menu'.open_window('g')
```
This opens a window showing your mappings that start with a `g`. You can press one of the keys in the popup menu to complete or advance the mapping.

So, if we want to see hints for mappings starting with `g`, then all we have to do is make this window appear when we press `g`, like so:
```lua
vim.keymap.set( -- define a new mapping
  'n',          -- in Normal mode
  'g',          -- which is bound to the 'g' key
  function()    -- executing this function
    require 'key-menu'.open_window('g')
  end)
```
Now, when we press `g`, if we don't quickly press another key (within `timeoutlen`) to invoke a different mapping (like `gx` or `gc`), then _this_ mapping will be executed, which pops up the `key-menu` window.

It's annoying that we have to say `'g'` twice, once in the arguments to `vim.keymap.set`, and once in the arguments to `open_window`. So `key-menu` provides a convenience function called `set`, which can be used like this:
```lua
require 'key-menu'.set( -- pop up a hint window
  'n',                  -- in Normal mode
  'g')                  -- when the letter g is pressed
```
This is the same as the `vim.keymap.set` in the previous code block.

We can also use `desc` to configure the hint that is shown in the window. For example, suppose that we use `<Space>` as a leader key, and `<Space>g` for a collection of Git-related mappings. Then we might do:
```lua
require 'key-menu'.set('n', '<Space>')
require 'key-menu'.set('n', '<Space>g', {desc='Git'})
```
Now a hint window will be shown if you press `<Space>`, with a `g → Git` entry.

## *Experimental*: support for built-in mappings

We are in the process of adding support for Neovim's built-in commands. Follow [this issue](https://github.com/linty-org/key-menu.nvim/issues/7) for updates, or if you would like to contribute to this feature. To turn on key-menu.nvim hints for builtins starting with `g`, add this to your `init.lua`:
```lua
require 'key-menu'.set('n', 'g')
```

## Related plugins

- [folke/which-key.nvim](https://github.com/folke/which-key.nvim)
- [spinks/vim-leader-guide](https://github.com/spinks/vim-leader-guide)
- [lifepillar/vim-cheat40](https://github.com/lifepillar/vim-cheat40)
- [hecal3/vim-leader-guide](https://github.com/hecal3/vim-leader-guide)
- [liuchengxu/vim-which-key](https://github.com/liuchengxu/vim-which-key)
