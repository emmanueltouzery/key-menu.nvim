function _filter(pred, arr)
  local result = {}
  for _, x in ipairs(arr) do
    if pred(x) then
      table.insert(result, x)
    end
  end
  return result
end

function _map(func, arr)
  local result = {}
  for _, x in ipairs(arr) do
    table.insert(result, func(x))
  end
  return result
end
-- print(vim.inspect(_map(function(x) return x*x end, {1, 2, 3})))

function _partial(func, x)
  local function result(y)
    return func(x, y)
  end
  return result
end
-- function add(x, y) return x + y end
-- print(vim.inspect(_map(_partial(add, 3), {1, 2, 3})))

function _starts_with(prefix, s)
  return s:sub(1, #prefix) == prefix
end
-- print(_starts_with('abc', 'ab'))
-- print(_starts_with('ab', 'ab'))
-- print(_starts_with('ab', 'abc'))

function _ends_with(suffix, s)
  return s:sub(#s - (#suffix - 1), #s) == suffix
end
-- print(_ends_with('abc', 'ab'))
-- print(_ends_with('bc', 'abc'))
-- print(_ends_with('ab', 'ab'))
-- print(_ends_with('ab', 'abc'))

function is_prefix_mapping_starting_with(prefix, mapping)
  return #prefix ~= #mapping.lhs and _starts_with(prefix, mapping.lhs)
end

function prefix_mappings_starting_with(prefix, mappings)
  return _filter(_partial(is_prefix_mapping_starting_with, prefix), mappings)
end
-- print(vim.inspect(prefix_mappings_starting_with(' ', vim.api.nvim_get_keymap('n'))))

function peel(lhs)
  --[[
  -- Peel off the next keystroke of a 'lhs'.
  -- For example, peel('abc') => 'a', 'bc',
  --              peel('<space>foo') => '<space>', 'foo'
  --
  -- That's the semantics, anyway. The implementation is naive.
  --]]
  if lhs:sub(1, 1) == '<' then
    local last = 2
    while lhs:sub(last, last) ~= '>' do
      last = last + 1
    end
    return lhs:sub(1, last), lhs:sub(last+1, -1)
  end
  return lhs:sub(1, 1), lhs:sub(2, -1)
end
-- print(peel('abc')) -- a bc
-- print(peel('<Esc>foo')) -- <Esc> foo

function peel_after(prefix, lhs)
  if lhs:sub(1, #prefix) ~= prefix then
    error('Prefix "' .. prefix '" does not match start of "' .. lhs .. '"')
  end
  return peel(lhs:sub(#prefix+1, -1))
end
-- print(peel_after('ab', 'abcde')) -- c de

function raw_layout_default_config()
  return {
    padding = 2,
    spacing = 2,
    middle_text = ' → ',
  }
end

function raw_layout(keys, descriptions, max_width, config)
  if not config then config = raw_layout_default_config() end

  local max_key_width = math.max(unpack(_map(vim.fn.strdisplaywidth, keys)))
  local middle_width = vim.fn.strdisplaywidth(config.middle_text)
  local max_description_width = math.max(unpack(_map(vim.fn.strdisplaywidth, descriptions)))
  local num_columns = math.floor((max_width - 2*config.padding + config.spacing) /
                                 (max_key_width + middle_width + max_description_width + config.spacing))
  if num_columns == 0 then
    error('Does not fit')
  end
  local fstring = string.format('%%%ds%s%%-%ds', max_key_width, config.middle_text, max_description_width)
  local num_rows = math.ceil(#keys / num_columns)
  local rows = {}
  while #rows * num_columns < #keys do
    local row = string.rep(' ', config.padding)
    for column = 1, num_columns do
      if column > 1 then row = row .. string.rep(' ', config.spacing) end
      local index = num_rows * (column - 1) + #rows + 1
      if index <= #keys then
        row = row .. string.format(fstring, keys[index], descriptions[index])
      else
        row = row .. string.rep(' ', max_key_width + middle_width + max_description_width)
      end
    end
    row = row .. string.rep(' ', config.padding)
    table.insert(rows, row)
  end
  return rows
end
-- print(vim.inspect(raw_layout({'a', 'b', 'ESC'}, {'append', 'behead', 'quit'}, 30)))

function test_raw_layout()
  local function ok(result, expected)
    if #result ~= #expected then return false end
    for i = 1, #result do
      if result[i] ~= expected[i] then return false end
    end
    return true
  end

  function test_case(input, expected)
    local result = raw_layout(unpack(input))
    if not ok(result, expected) then
      print(string.format('Error: expected "%s", but got "%s"', vim.inspect(expected), vim.inspect(result)))
    end
  end

  local config = {
    padding = 1,
    spacing = 2,
    middle_text = ' → ',
  }

  test_case({{'x'}, {'foo'}, 10, config},
            {' x → foo '})

  local tight_config = {
    padding = 0,
    spacing = 0,
    middle_text = '',
  }

  test_case({{'xx', 'yyy'}, {'zzz', 'ww'}, 12, tight_config},
            {' xxzzzyyyww '})
  test_case({{'a', 'b'}, {'😶', 'd'}, 4, tight_config},
            {'a😶', 'bd '})

  print('All tests passed!')
end

function compute_keys(prefix, mappings)
  local complete_keys = {} -- keystroke-to-mapping
  local prefix_keys = {} -- keystroke-to-list-of-mappings
  for _, mapping in ipairs(mappings) do
    -- Get the key and description for this mapping.
    local key, tail = peel_after(prefix, mapping.lhs)
    local is_complete = (#tail == 0)
    if is_complete then
      complete_keys[key] = mapping
    else
      if not prefix_keys[key] then prefix_keys[key] = {} end
      table.insert(prefix_keys[key], mapping)
    end
  end
  return prefix_keys, complete_keys
end
-- print(vim.inspect({compute_keys(' ', prefix_mappings_starting_with(' ', vim.api.nvim_get_keymap('n')))}))

-- XXX: Unused.
function compute_keys_fresh(prefix, mode)
  local mappings = prefix_mappings_starting_with(prefix, vim.api.nvim_get_keymap(mode))
  return compute_keys(prefix, mappings)
end
-- print(vim.inspect({compute_keys_fresh(' ', 'n')}))

function _add_table_keys(set, t)
  for key, _ in pairs(t) do
    set[key] = true
  end
end

function _set_to_list(set)
  local result = {}
  for key, _true in pairs(set) do
    table.insert(result, key)
  end
  return result
end

function keystroke_comparator(k1, k2)
  local lk1 = string.lower(k1)
  local lk2 = string.lower(k2)
  if lk1 == lk2 then
    return k1 < k2
  else
    return lk1 < lk2
  end
end

local LC_CMD = '<cmd>'
local LC_CR = '<cr>'

function pretty_description(mapping)
  if mapping.rhs then
    local lowercase = string.lower(mapping.rhs)
    if _starts_with(LC_CMD, lowercase) and _ends_with(LC_CR, lowercase) then
      return ':' .. mapping.rhs:sub(#LC_CMD + 1, #mapping.rhs - #LC_CR)
    end
  end
  return mapping.rhs
end
-- print(pretty_description({rhs = '<Cmd>fuck<CR>'}))

function pretty_keystrokes_and_descriptions(prefix_keys, complete_keys)
  local all_keystrokes = {}
  _add_table_keys(all_keystrokes, prefix_keys)
  _add_table_keys(all_keystrokes, complete_keys)
  local sorted_keystrokes = _set_to_list(all_keystrokes)
  table.sort(sorted_keystrokes, keystroke_comparator)

  local keystrokes = {}
  local descriptions = {}
  for _, keystroke in ipairs(sorted_keystrokes) do
    if complete_keys[keystroke] then
      table.insert(keystrokes, keystroke)
      table.insert(descriptions, pretty_description(complete_keys[keystroke]))
    end
    if prefix_keys[keystroke] then
      table.insert(keystrokes, keystroke)
      table.insert(descriptions, "...")
    end
  end
  return keystrokes, descriptions
end
-- print(vim.inspect({pretty_keystrokes_and_descriptions(compute_keys_fresh(' ', 'n'))}))

-- print(vim.inspect(raw_layout({'a', 'b', 'ESC'}, {'append', 'behead', 'quit'}, 30)))

-- local ks, ds = pretty_keystrokes_and_descriptions(compute_keys_fresh(' ', 'n'))
-- print(vim.inspect(raw_layout(ks, ds, 100)))

-- XXX: This doesn't really work.
function shadow_all_global_mappings(buf)
  -- We only need to worry about normal mode, because with no mappings available it should not even be possible to get into another mode.
  mappings = vim.api.nvim_get_keymap('n')
  handled_keystrokes = {}
  for _, mapping in ipairs(mappings) do
    keystroke, suffix = peel(mapping.lhs)
    print('Shadowing ' .. keystroke)
    if not handled_keystrokes[keystroke] then
      vim.api.nvim_buf_set_keymap(buf, 'n', keystroke, '', {})
      handled_keystrokes[keystroke] = true
    end
  end
end

function open_window(prefix, mode)
  local function set_command_line(s)
    print(s)
  end

  local function clear_command_line()
    print(' ') -- This is janky. An empty string seems to cause the print to get skipped altogether.
  end

  local ui = vim.api.nvim_list_uis()[1] -- FIXME: What do we do if there is not exactly one UI??

  local buf = vim.api.nvim_create_buf(false, true)
  shadow_all_global_mappings(buf)

  -- XXX: At this point the buffer is not yet populated, so the window dimensions are not yet set correctly for the first real draw. I would really like to be able to, for the first draw, configure the window while it is still not visible, and then show it already all configured correctly. I don't think the Neovim API currently supports this. 2022-04-22
  local win = vim.api.nvim_open_win(buf, true, {
    anchor = 'SW', relative = 'editor',
    row = ui.height, col = 0,
    -- XXX: I would like the height to be 0 initially, but Neovim 0.7 does not allow that. Width/height must be positive integers. 2022-04-22
    width = ui.width, height = 1,
    style = 'minimal',
    border = {'─', '─', '─', '', '─', '─', '─', ''},
  })

  local function close_window()
    vim.api.nvim_win_close(win, true)
    clear_command_line()
  end

  local mappings = prefix_mappings_starting_with(prefix, vim.api.nvim_get_keymap(mode))

  local redraw = function(prefix_keys, complete_keys)
    local pretty_keystrokes, pretty_descriptions = pretty_keystrokes_and_descriptions(prefix_keys, complete_keys)
    local rows = raw_layout(pretty_keystrokes, pretty_descriptions, ui.width)

    vim.api.nvim_buf_set_lines(buf, 0, -1, false, {})
    vim.api.nvim_win_set_config(win, {width = ui.width, height = #rows + 2})
    vim.api.nvim_buf_set_lines(buf, 1, -1, false, rows)
  end

  local remove_local_mappings = nil
  local add_local_mappings = nil -- XXX: We declare this symbol here for lexical scoping. Is there a better way to do this?

  local update_state = function(new_prefix, new_mappings)
    if remove_local_mappings then
      remove_local_mappings()
      remove_local_mappings = nil -- Just to be safe.
    end

    -- Our state is basically encapsulated by the (prefix, mappings) pair.
    prefix, mappings = new_prefix, new_mappings
    -- XXX: Do we really need to have (prefix, mappings) as persistent state?

    local prefix_keys, complete_keys = compute_keys(prefix, mappings)
    add_local_mappings(prefix, prefix_keys, complete_keys)

    redraw(prefix_keys, complete_keys)
  end

  add_local_mappings = function(prefix, prefix_keys, complete_keys)
    local mode_ = 'n'
    local opts_ = {buffer=buf}

    remove_local_mappings = function()
      for keystroke, next_mappings in pairs(prefix_keys) do
        vim.keymap.del(mode_, keystroke, opts_)
      end

      for keystroke, mapping in pairs(complete_keys) do
        -- TODO.
      end
    end

    do
      for keystroke, next_mappings in pairs(prefix_keys) do
        local cb = function() update_state(prefix .. keystroke, next_mappings) end
        vim.keymap.set(mode_, keystroke, cb, opts_)
      end

      for keystroke, mapping in pairs(complete_keys) do
        -- TODO. We need the command to get executed in the original context, i.e., the original buffer. Maybe the easiest way to guarantee this is to just close this window??
      end
    end
  end

  update_state(prefix, mappings)

  vim.keymap.set('n', '<Esc>', close_window, {buffer=buf})

  print(' SPC → …')
end

vim.keymap.set('n', '<Leader>', function() open_window(' ', 'n') end)

function test_all()
  test_raw_layout()
end
