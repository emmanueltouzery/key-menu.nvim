# key-menu.nvim

**🚧 This plugin is currently in a beta state. It is usable and I use it as part of my normal, everyday config. But many features are missing and there may be bugs. Bug reports and feature requests are welcome! 🚧**

![demo](https://user-images.githubusercontent.com/5308024/169894329-7e14d3b1-fa9e-4326-92f2-de82d3b0096e.gif)

## Highlights

- Just works. Lightweight and simple. Minimal configuration.
- Hint window pops up next to your cursor, and uses as little screen real estate as possible.
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

-- The arguments to key-menu.set are the same as those for vim.keymap.set,
-- except that the RHS/callback argument is omitted.

-- Create a buffer-local mapping group to echo some example text.
require 'key-menu'.set('n', '<Space>s',
  {desc = 'Say something', buffer=true})
-- Create buffer-local mappings to say hello and goodbye.
vim.keymap.set('n', '<Space>sh',
  function() print("Hello, world") end,
  {desc = '...hello!', buffer = true})
vim.keymap.set('n', '<Space>sg',
  function() print("Goodbye, world!") end,
  {desc = '...goodbye!', buffer = true})
```

Final results: ![sample-config-root](https://user-images.githubusercontent.com/5308024/170115903-a10692a8-11b7-4f4b-9194-c958251772fb.png) ![sample-config-git](https://user-images.githubusercontent.com/5308024/170115928-cbd9cb25-eb13-49ee-9fa0-eab22d0f9fe3.png) ![sample-config-say](https://user-images.githubusercontent.com/5308024/170115942-1ab0d108-77e9-47ad-a019-c766fa26965f.png)

## Related plugins

- [folke/which-key.nvim](https://github.com/folke/which-key.nvim)
- [spinks/vim-leader-guide](https://github.com/spinks/vim-leader-guide)
- [lifepillar/vim-cheat40](https://github.com/lifepillar/vim-cheat40)
- [hecal3/vim-leader-guide](https://github.com/hecal3/vim-leader-guide)
- [liuchengxu/vim-which-key](https://github.com/liuchengxu/vim-which-key)
