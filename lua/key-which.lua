local function _filter(pred, arr)
  local result = {}
  for _, x in ipairs(arr) do
    if pred(x) then
      table.insert(result, x)
    end
  end
  return result
end

local function _map(func, arr)
  local result = {}
  for _, x in ipairs(arr) do
    table.insert(result, func(x))
  end
  return result
end
-- print(vim.inspect(_map(function(x) return x*x end, {1, 2, 3})))

local function _concat(t1, t2)
  local result = {}
  for _, x in ipairs(t1) do
    table.insert(result, x)
  end
  for _, x in ipairs(t2) do
    table.insert(result, x)
  end
  return result
end

local function _partial(func, x)
  local function result(y)
    return func(x, y)
  end
  return result
end
-- function add(x, y) return x + y end
-- print(vim.inspect(_map(_partial(add, 3), {1, 2, 3})))

local function _starts_with(prefix, s)
  return s:sub(1, #prefix) == prefix
end
-- print(_starts_with('abc', 'ab'))
-- print(_starts_with('ab', 'ab'))
-- print(_starts_with('ab', 'abc'))

local function _ends_with(suffix, s)
  return s:sub(#s - (#suffix - 1), #s) == suffix
end
-- print(_ends_with('abc', 'ab'))
-- print(_ends_with('bc', 'abc'))
-- print(_ends_with('ab', 'ab'))
-- print(_ends_with('ab', 'abc'))

local function is_prefix_mapping_starting_with(prefix, mapping)
  return #prefix ~= #mapping.lhs and _starts_with(prefix, mapping.lhs)
end

local function prefix_mappings_starting_with(prefix, mappings)
  return _filter(_partial(is_prefix_mapping_starting_with, prefix), mappings)
end
-- print(vim.inspect(prefix_mappings_starting_with(' ', vim.api.nvim_get_keymap('n'))))

local function peel(lhs)
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

local function peel_after(prefix, lhs)
  if lhs:sub(1, #prefix) ~= prefix then
    error('Prefix "' .. prefix '" does not match start of "' .. lhs .. '"')
  end
  return peel(lhs:sub(#prefix+1, -1))
end
-- print(peel_after('ab', 'abcde')) -- c de

local leader_names

local function get_leader_name(prefix)
  local keystroke, result
  local tree = leader_names or {}
  while tree and #prefix > 0 do
    keystroke, prefix = peel(prefix)
    result, tree = unpack(tree[keystroke] or {})
  end
  if #prefix == 0 and result then
    return result
  else
    return ''
  end
end

local function raw_layout_default_config()
  return {
    padding = 1,
    spacing = 3,
    middle_text = ' → ',
  }
end

local function char_byte_count(s, i)
  -- Get byte count of unicode character starting at byte i (RFC 3629).
  -- https://neovim.discourse.group/t/how-do-you-work-with-strings-with-multibyte-characters-in-lua/2437/3
  local c = string.byte(s, i or 1)

  if c > 0 and c <= 127 then
    return 1
  elseif c >= 194 and c <= 223 then
    return 2
  elseif c >= 224 and c <= 239 then
    return 3
  elseif c >= 240 and c <= 244 then
    return 4
  else
    return 1 -- Copilot suggestion, IDK...
  end
end

local function truncate_to_display_width(s, width)
  -- O(n), I'm not sure it's possible to do better.
  if width == 0 then
    return ''
  end

  local result = ''
  local last_char_bytes = nil
  local display_width = 0
  local i = 1
  while i <= #s do
    local char_bytes = char_byte_count(s, i)
    local char = s:sub(i, i + char_bytes - 1)
    local char_display_width = vim.api.nvim_strwidth(char)
    if display_width + char_display_width > width then
      if #result == 0 then
        return '…'
      elseif display_width + 1 <= width then
        return result .. '…'
      else
        return result:sub(1, #result-last_char_bytes) .. '…'
      end
    end
    result = result .. char
    display_width = display_width + char_display_width
    i = i + char_bytes
    last_char_bytes = char_bytes
  end
  return result
end

local function test_truncate_to_display_width()
  local function test_case(s, width, expected)
    result = truncate_to_display_width(s, width)
    if result ~= expected then
      print(string.format('For ("%s", %d), expected %s, and got %s', s, width, expected, result))
      return false
    else
      return true
    end
  end

  local all_ok = true
  all_ok = all_ok and test_case('abc', 0, '')
  all_ok = all_ok and test_case('a', 1, 'a')
  all_ok = all_ok and test_case('ab', 1, '…')
  all_ok = all_ok and test_case('abc', 2, 'a…')
  all_ok = all_ok and test_case('abcd', 3, 'ab…')
  all_ok = all_ok and test_case('abc😶', 3, 'ab…')
  all_ok = all_ok and test_case('abc😶', 4, 'abc…')
  all_ok = all_ok and test_case('abc😶', 5, 'abc😶')
  return all_ok
end

local function raw_layout(keys, descriptions, max_width, config)
  if #keys == 0 then
    return {}
  end

  if not config then config = raw_layout_default_config() end

  if max_width < 2*config.padding + 1 then
    -- We don't even have space for a single character (…).
    return {}
  end

  local max_key_width = math.max(unpack(_map(vim.api.nvim_strwidth, keys)))
  local middle_width = vim.api.nvim_strwidth(config.middle_text)
  local max_description_width = math.max(unpack(_map(vim.api.nvim_strwidth, descriptions)))
  local num_columns = math.floor((max_width - 2*config.padding + config.spacing) /
                                 (max_key_width + middle_width + max_description_width + config.spacing))

  local truncate = false
  if num_columns == 0 then
    num_columns = 1
    truncate = true
  end

  local num_rows = math.ceil(#keys / num_columns)
  local rows = {}
  while #rows * num_columns < #keys do
    local row = ''
    for column = 1, num_columns do
      if column > 1 then row = row .. string.rep(' ', config.spacing) end
      local index = num_rows * (column - 1) + #rows + 1
      if index <= #keys then
        local key, description = keys[index], descriptions[index]
        row = row
           .. string.rep(' ', max_key_width - vim.api.nvim_strwidth(key)) .. key
           .. config.middle_text
           .. description
        if not truncate then
          row = row .. string.rep(' ', max_description_width - vim.api.nvim_strwidth(description))
        end
      else
        row = row .. string.rep(' ', max_key_width + middle_width + max_description_width)
      end
    end
    if truncate then
      row = truncate_to_display_width(row, max_width - 2*config.padding)
    end
    row = string.rep(' ', config.padding) .. row .. string.rep(' ', config.padding)
    table.insert(rows, row)
  end
  return rows
end
-- print(vim.inspect(raw_layout({'a', 'b', 'ESC'}, {'append', 'behead', 'quit'}, 30)))

local function test_raw_layout()
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
      return false
    else
      return true
    end
  end

  local config = {
    padding = 1,
    spacing = 2,
    middle_text = ' → ',
  }

  local all_ok = true

  all_ok = all_ok and test_case({{}, {}, 10, config},
                                {})
  all_ok = all_ok and test_case({{'x'}, {'y'}, 3, config},
                                {' … '})
  all_ok = all_ok and test_case({{'x'}, {'y'}, 4, config},
                                {' x… '})
  all_ok = all_ok and test_case({{'x'}, {'y'}, 11, {padding=5, spacing=0, middle_text=''}},
                                {'     …     '})
  all_ok = all_ok and test_case({{'x', 'z'}, {'y', 'w'}, 14, config},
                                {' x → y  z → w '})
  all_ok = all_ok and test_case({{'x'}, {'foo'}, 10, config},
                                {' x → foo '})

  local tight_config = {
    padding = 0,
    spacing = 0,
    middle_text = '',
  }

  all_ok = all_ok and test_case({{'xx', 'yyy'}, {'zzz', 'ww'}, 12, tight_config},
                                {' xxzzzyyyww '})
  all_ok = all_ok and test_case({{'a', 'b'}, {'😶', 'd'}, 4, tight_config},
                                {'a😶', 'bd '})

  return all_ok
end

local function compute_keys(prefix, mappings)
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
local function compute_keys_fresh(prefix, mode)
  local mappings = prefix_mappings_starting_with(prefix, vim.api.nvim_get_keymap(mode))
  return compute_keys(prefix, mappings)
end
-- print(vim.inspect({compute_keys_fresh(' ', 'n')}))

local function _add_table_keys(set, t)
  for key, _ in pairs(t) do
    set[key] = true
  end
end

local function _set_to_list(set)
  local result = {}
  for key, _true in pairs(set) do
    table.insert(result, key)
  end
  return result
end

local function keystroke_comparator(k1, k2)
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

local function pretty_description(mapping)
  if mapping.desc then
    return mapping.desc
  end
  if mapping.rhs then
    local lowercase = string.lower(mapping.rhs)
    if _starts_with(LC_CMD, lowercase) and _ends_with(LC_CR, lowercase) then
      return ':' .. mapping.rhs:sub(#LC_CMD + 1, #mapping.rhs - #LC_CR)
    else
      return mapping.rhs
    end
  else
    return '(Callback)'
  end
end
-- print(pretty_description({rhs = '<Cmd>fuck<CR>'}))

local pretty_keystroke_dict = {
  [" "] = 'SPC',
}

local function pretty_keystroke(keystroke)
  return pretty_keystroke_dict[keystroke] or keystroke
end

local function pretty_items(prefix, prefix_keys, complete_keys)
  local all_keystrokes = {}
  _add_table_keys(all_keystrokes, prefix_keys)
  _add_table_keys(all_keystrokes, complete_keys)
  local sorted_keystrokes = _set_to_list(all_keystrokes)
  table.sort(sorted_keystrokes, keystroke_comparator)

  local items = {}
  for _, keystroke in ipairs(sorted_keystrokes) do
    if complete_keys[keystroke] then
      table.insert(items, {
        keystroke = pretty_keystroke(keystroke),
        description = pretty_description(complete_keys[keystroke]),
      })
    end
    if prefix_keys[keystroke] then
      table.insert(items, {
        keystroke = pretty_keystroke(keystroke),
        description = get_leader_name(prefix .. keystroke)
      })
    end
  end
  return items
end
-- print(vim.inspect({pretty_items(' ', compute_keys_fresh(' ', 'n'))}))

-- print(vim.inspect(raw_layout({'a', 'b', 'ESC'}, {'append', 'behead', 'quit'}, 30)))

local function map_to_nop(buf, keystroke)
  vim.api.nvim_buf_set_keymap(buf, 'n', keystroke, '', {nowait=true})
end

-- XXX: This doesn't really work right.
-- https://neovim.discourse.group/t/what-is-the-usual-way-of-disabling-default-mappings-when-building-a-modal-dialog/2436
local function shadow_all_global_mappings(buf)
  -- We only need to worry about normal mode, because with no mappings available it should not even be possible to get into another mode.
  local chars = 'abcdefghijklmnopqrstuvwxyz'
             .. 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
             .. '0123456789'
             .. '~!#$%^&*()_+`-=[]{}|\\;"\'<>,.?/'
             -- .. ':'

  for i = 1, #chars do
    local char = chars:sub(i, i)
    map_to_nop(buf, char)
    map_to_nop(buf, string.format('<C-%s>', char))
    map_to_nop(buf, string.format('<A-%s>', char))
  end
end

local function get_keystrokes(prefix)
  local result = {}
  while #prefix ~= 0 do
    local keystroke
    keystroke, prefix = peel(prefix)
    table.insert(result, keystroke)
  end
  return result
end

local function open_window(prefix, mode)
  local original_buf = vim.api.nvim_get_current_buf()

  local function set_command_line()
    local keystrokes = _map(pretty_keystroke, get_keystrokes(prefix))
    table.insert(keystrokes, '…')
    print(' ' .. table.concat(keystrokes, ' → '))
  end

  local function clear_command_line()
    print(' ') -- This is janky. An empty string seems to cause the print to get skipped altogether.
  end

  local buf = vim.api.nvim_create_buf(false, true)
  shadow_all_global_mappings(buf)

  local initial_ui = vim.api.nvim_list_uis()[1] -- FIXME: What do we do if there is not exactly one UI??
  -- XXX: At this point the buffer is not yet populated, so the window dimensions are not yet set correctly for the first real draw. I would really like to be able to, for the first draw, configure the window while it is still not visible, and then show it already all configured correctly. I don't think the Neovim API currently supports this. 2022-04-22
  local win = vim.api.nvim_open_win(buf, true, {
    anchor = 'SW', relative = 'editor',
    row = initial_ui.height, col = 0,
    -- XXX: I would like the height to be 0 initially, but Neovim 0.7 does not allow that. Width/height must be positive integers. 2022-04-22
    width = initial_ui.width, height = 1,
    style = 'minimal',
    border = 'rounded',
  })
  vim.api.nvim_win_set_option(win, 'winhighlight', 'Normal:Normal')

  local function close_window()
    vim.api.nvim_win_close(win, true)
    clear_command_line()
  end

  local global_mappings = vim.api.nvim_get_keymap(mode)
  local buffer_mappings = vim.api.nvim_buf_get_keymap(original_buf, mode)
  local all_mappings = _concat(global_mappings, buffer_mappings)
  local mappings = prefix_mappings_starting_with(prefix, all_mappings)

  local redraw = function(prefix_keys, complete_keys)
    -- Basically everything is one-based.

    local min_width = 15 -- TODO: Set from keystrokes-so-far.

    local horizontal_padding = 1
    local horizontal_spacing = 3
    local items = pretty_items(prefix, prefix_keys, complete_keys)
    local max_num_rows = 10
    local num_rows = math.min(#items, max_num_rows)
    local num_cols = math.ceil(#items / num_rows)
    local get_col_num = function(item_num) return math.ceil(item_num / num_rows) end
    local get_row_num = function(item_num) return 1 + (item_num-1) % num_rows end
    local sep = ' → '
    local sep_width = vim.api.nvim_strwidth(sep)

    local col_widths = {}
    local keystroke_widths = {}
    local description_widths = {}
    local function _set_to_at_least(widths_by_col, col_num, value)
      if not widths_by_col[col_num] then widths_by_col[col_num] = 0 end
      widths_by_col[col_num] = math.max(widths_by_col[col_num], value)
    end
    for item_num = 1, #items do
      local item = items[item_num]
      local col_num = get_col_num(item_num)
      local keystroke_width = vim.api.nvim_strwidth(item.keystroke)
      local description_width = vim.api.nvim_strwidth(item.description)
      local display_width = keystroke_width + sep_width + description_width
      _set_to_at_least(col_widths, col_num, display_width)
      _set_to_at_least(keystroke_widths, col_num, keystroke_width)
      _set_to_at_least(description_widths, col_num, description_width)
    end

    -- Compute col_start[col_num] and the total width of the window's text.
    local col_starts = {}
    local width = horizontal_padding + 1
    for col_num = 1, num_cols do
      col_starts[col_num] = width
      width = width + horizontal_spacing + col_widths[col_num]
    end
    width = width - horizontal_spacing + horizontal_padding - 1
    width = math.max(width, min_width)

    vim.api.nvim_buf_set_lines(buf, 0, -1, false, {})
    vim.api.nvim_win_set_config(win, {width = width, height = num_rows})

    local blank_lines = {}
    for _ = 1, num_rows do
      table.insert(blank_lines, string.rep(' ', width))
    end
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, blank_lines)

    for item_num = #items, 1, -1 do
      -- It is important that we (1) loop backwards and (2) add the description, sep, key strings backwards, because as of 2022-05-03 (and I guess forever since Neovim won't break APIs), `vim.api.buf_set_text` takes _byte indices_, not display columns!
      -- XXX: https://github.com/neovim/neovim/issues/18406
      local item = items[item_num]
      local row_num = get_row_num(item_num)
      local col_num = get_col_num(item_num)
      local keystroke_width = vim.api.nvim_strwidth(item.keystroke)
      local description_width = vim.api.nvim_strwidth(item.description)
      local keystroke_col_width = keystroke_widths[col_num]
      local keystroke_start = col_starts[col_num] + (keystroke_col_width - keystroke_width)
      local keystroke_end = keystroke_start + keystroke_width - 1
      local sep_start = keystroke_end + 1
      local sep_end = sep_start + sep_width - 1
      local description_start = sep_end + 1
      local description_end = description_start + description_width - 1

      -- Basically everything is one-based and end-inclusive, except here:
      vim.api.nvim_buf_set_text(buf, row_num-1, description_start-1, row_num-1, description_end, {item.description})
      vim.api.nvim_buf_set_text(buf, row_num-1, sep_start-1, row_num-1, sep_end, {sep})
      vim.api.nvim_buf_set_text(buf, row_num-1, keystroke_start-1, row_num-1, keystroke_end, {item.keystroke})
    end

    --[[
    local ui = vim.api.nvim_list_uis()[1] -- FIXME: What do we do if there is not exactly one UI??
    local rows = raw_layout(pretty_keystrokes, pretty_descriptions, ui.width)

    vim.api.nvim_win_set_config(win, {
      -- anchor = 'NW', relative = 'cursor', -- XXX: https://github.com/neovim/neovim/issues/18368
      row = ui.height, col = 0,
      width = ui.width, height = #rows,
    })
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, rows)
    for line_number = 1, #rows do
      vim.api.nvim_buf_add_highlight(buf, -1, 'KeyWhichWindow', line_number-1, 1, -1)
    end

    -- XXX: https://github.com/neovim/neovim/issues/18369
    set_command_line()
    ]]--
  end

  -- XXX: We declare these symbols here for lexical scoping. Is there a better way to do this?
  local remove_local_mappings = nil
  local add_local_mappings = nil
  local add_default_mappings = nil

  local full_update = function()
    -- Call this after the statre (prefix, mappings) has been updated, or just to do a full redraw.

    if remove_local_mappings then
      remove_local_mappings()
      remove_local_mappings = nil -- Just to be safe.
    end
    add_default_mappings()

    local prefix_keys, complete_keys = compute_keys(prefix, mappings)
    add_local_mappings(prefix_keys, complete_keys)

    redraw(prefix_keys, complete_keys)
  end

  add_local_mappings = function(prefix_keys, complete_keys)
    local opts_ = {buffer=buf, nowait=true}

    remove_local_mappings = function()
      for keystroke, _ in pairs(prefix_keys) do
        map_to_nop(buf, keystroke)
      end
      for keystroke, _ in pairs(complete_keys) do
        map_to_nop(buf, keystroke)
      end
    end

    do
      for keystroke, next_mappings in pairs(prefix_keys) do
        local cb = function()
          -- Our state is basically encapsulated by the (prefix, mappings) pair.
          prefix, mappings = prefix .. keystroke, next_mappings
          -- XXX: Do we really need to have (prefix, mappings) as persistent state?
          full_update()
        end
        vim.keymap.set('n', keystroke, cb, opts_)
      end
      for keystroke, mapping in pairs(complete_keys) do
        local cb = function()
          close_window()
          if mapping.callback then
            mapping.callback()
          else
            local feedkeys_mode = ''
            if mapping.noremap then
              feedkeys_mode = feedkeys_mode .. 'n'
            else
              feedkeys_mode = feedkeys_mode .. 'm'
            end
            local rhs = vim.api.nvim_replace_termcodes(mapping.rhs, true, true, true)
            vim.api.nvim_feedkeys(rhs, feedkeys_mode, false)
          end
        end
        vim.keymap.set('n', keystroke, cb, opts_)
      end
    end
  end

  local backspace = function()
    local keystrokes = get_keystrokes(prefix)
    if #keystrokes < 2 then
      close_window()
    else
      prefix = table.concat(vim.list_slice(keystrokes, 1, #keystrokes - 1))
      mappings = prefix_mappings_starting_with(prefix, all_mappings)
      full_update()
    end
  end

  add_default_mappings = function()
    vim.keymap.set('n', '<Esc>', close_window, {buffer=buf, nowait=true})
    vim.keymap.set('n', '<C-c>', close_window, {buffer=buf, nowait=true})
    vim.keymap.set('n', '<BS>', backspace, {buffer=buf, nowait=true})
  end

  vim.api.nvim_create_autocmd("BufLeave", {buffer=buf, callback=close_window})
  vim.api.nvim_create_autocmd("VimResized", {buffer=buf, callback=full_update})

  full_update()
end

local function setup(opts)
  opts = opts or {}
  vim.keymap.set('n', '<Leader>', function() open_window(' ', 'n') end)
  leader_names = opts.leader_names
end

local function test_all()
  local all_ok = true
  all_ok = all_ok and test_truncate_to_display_width()
  all_ok = all_ok and test_raw_layout()
  if all_ok then
    print('All tests passed!')
  else
    print('Some tests FAILED!')
  end
  return all_ok
end

-- test_all()

return {
  setup = setup,
}
