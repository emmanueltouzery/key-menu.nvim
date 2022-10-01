local open_window_callbacks = {}
do
  -- Make open_window_callbacks have weak key refs.
  local mt = {}
  mt.__mode = 'k'
  setmetatable(open_window_callbacks, mt)
end

local function _partial(func, x)
  local function result(y)
    return func(x, y)
  end
  return result
end
-- function add(x, y) return x + y end
-- print(vim.inspect(vim.tbl_map(_partial(add, 3), {1, 2, 3})))

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

local function is_not_nop(mapping)
  return mapping.rhs ~= ''
end

local function is_not_hidden(mapping)
  if mapping.desc == nil or mapping.desc == "" then
    return true
  end
  return string.upper(mapping.desc) ~= 'HIDDEN'
end

local function is_prefix_mapping_starting_with(prefix, mapping)
  return #prefix ~= #mapping.lhs and _starts_with(prefix, mapping.lhs)
end

local function prefix_mappings_starting_with(prefix, mappings)
  return vim.tbl_filter(_partial(is_prefix_mapping_starting_with, prefix), mappings)
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

local function truncate(s, screen_cols)
  -- O(n), I'm not sure it's possible to do better.

  if screen_cols == 0 then
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
    if display_width + char_display_width > screen_cols then
      if #result == 0 then
        return '…'
      elseif display_width + 1 <= screen_cols then
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

local function test_truncate()
  local function test_case(s, width, expected)
    local result = truncate(s, width)
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

local function get_pretty_description(mapping)
  if mapping.desc then
    return mapping.desc
  elseif mapping.rhs then
    local lowercase = string.lower(mapping.rhs)
    if _starts_with(LC_CMD, lowercase) and _ends_with(LC_CR, lowercase) then
      return ':' .. mapping.rhs:sub(#LC_CMD + 1, #mapping.rhs - #LC_CR)
    else
      return mapping.rhs
    end
  elseif mapping.callback and not open_window_callbacks[mapping.callback] then
    return '(Callback)'
  else
    return ''
  end
end
-- print(pretty_description({rhs = '<Cmd>fuck<CR>'}))

local pretty_keystroke_dict = {
  [" "] = '␠',
}

local function modified_keystroke(keystroke)
  local n = vim.fn.char2nr(keystroke)
  if 1 <= n and n <= 26 then
    return string.format('CTRL-%s', vim.fn.nr2char(vim.fn.char2nr('A') - 1 + n))
  end
  if n == 29 then
    return 'CTRL-]'
  end
end

local function get_pretty_keystroke(keystroke)
  return pretty_keystroke_dict[keystroke]
      or modified_keystroke(keystroke)
      or keystroke
end

local function get_pretty_items(prefix, prefix_keys, complete_keys)
  local all_keystrokes = {}
  _add_table_keys(all_keystrokes, prefix_keys)
  _add_table_keys(all_keystrokes, complete_keys)
  local sorted_keystrokes = _set_to_list(all_keystrokes)
  table.sort(sorted_keystrokes, keystroke_comparator)

  local items = {}
  for _, keystroke in ipairs(sorted_keystrokes) do
    local pretty_keystroke = get_pretty_keystroke(keystroke)
    local mapping = complete_keys[keystroke] -- May be nil

    local pretty_description
    if mapping then
      pretty_description = truncate(
        get_pretty_description(mapping),
        40 -- XXX: Magic number, screen columns
      )
    else
      assert(prefix_keys[keystroke])
      pretty_description = get_leader_name(prefix .. keystroke)
    end

    local is_prefix_key = prefix_keys[keystroke] or (mapping and open_window_callbacks[mapping.callback])
    if is_prefix_key then pretty_description = pretty_description .. '…' end

    table.insert(items, {keystroke = pretty_keystroke, description = pretty_description})
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

local function normalize_keymap(keymap)
  keymap = vim.deepcopy(keymap)
  --[[
  for _, m in ipairs(keymap) do
    m.lhs = vim.api.nvim_replace_termcodes(m.lhs, true, true, true)
  end
  --]]
  return keymap
end

local function get_builtin_keymap(mode)
  local keymap = normalize_keymap(require 'km-builtins')
  keymap = vim.tbl_filter(function(m) return m.mode == mode end, keymap)
  for _, mapping in ipairs(keymap) do
    mapping.rhs = mapping.lhs
    mapping.noremap = true -- This is important.
  end
  return keymap
end

local function shadow(old_mappings, new_mappings)
  local new_lhss = {}
  for _, m in ipairs(new_mappings) do
    new_lhss[m.lhs] = true
  end
  local result = vim.deepcopy(old_mappings)
  result = vim.tbl_filter(function(m) return not new_lhss[m.lhs] end, result)
  vim.list_extend(result, new_mappings)
  return result
end

local function open_window(prefix)
  local mode = vim.fn.mode()
  prefix = vim.api.nvim_replace_termcodes(prefix, true, true, true) -- Pretty ugly. Is there a better way to do this?

  local original_buf = vim.api.nvim_get_current_buf()
  local orig_buf_keymap = vim.api.nvim_buf_get_keymap(original_buf, mode)

  local function get_command_line_text()
    local keystrokes = vim.tbl_map(get_pretty_keystroke, get_keystrokes(prefix))
    table.insert(keystrokes, '') -- table.insert(keystrokes, '…') -- Currently the cursor goes here.
    return table.concat(keystrokes, ' → ')
  end

  local buf = vim.api.nvim_create_buf(false, true)
  shadow_all_global_mappings(buf)

  local horizontal_padding = 1
  local horizontal_spacing = 3

  local anchor, row, col
  if vim.fn.screenrow() > vim.o.lines / 2 then
    anchor, row, col = 'SW', 0, 1
  else
    anchor, row, col = 'NW', 1, 1
  end

  -- XXX: At this point the buffer is not yet populated, so the window dimensions are not yet set correctly for the first real draw. I would really like to be able to, for the first draw, configure the window while it is still not visible, and then show it already all configured correctly. I don't think the Neovim API currently supports this. 2022-04-22
  -- XXX: Alternatively we could populate the buffer correctly before creating the window and create it to have the correct size on the first draw. 2022-05-09
  -- XXX: Alternatively we could (perhaps) set the width/height to be 0 initially, but Neovim 0.7 does not allow that. Width/height must be positive integers. 2022-04-22
  local win = vim.api.nvim_open_win(buf, true, {
    relative = 'cursor',
    anchor = anchor,
    row = row, col = col,
    width = 1, height = 1,
    style = 'minimal',
    border = 'rounded',
  })
  local border_width = 1

  vim.api.nvim_win_set_option(win, 'winhighlight', table.concat({
    'Normal:KeyMenuNormal',
    'FloatBorder:KeyMenuFloatBorder',
  }, ','))

  local close_window = function() vim.api.nvim_win_close(win, true) end

  local all_mappings = get_builtin_keymap(mode)
  all_mappings = shadow(all_mappings, normalize_keymap(vim.api.nvim_get_keymap(mode)))
  all_mappings = shadow(all_mappings, normalize_keymap(orig_buf_keymap))
  all_mappings = vim.tbl_filter(is_not_nop, all_mappings)
  all_mappings = vim.tbl_filter(is_not_hidden, all_mappings)

  local mappings = prefix_mappings_starting_with(prefix, all_mappings)

  local redraw = function(prefix_keys, complete_keys)
    -- Basically everything is one-based.

    local max_num_rows = 10

    ::start_redraw::

    local command_line_text = get_command_line_text()
    local pretty_keystrokes_so_far = string.rep(' ', horizontal_padding)
                                  .. command_line_text
                                  .. string.rep(' ', horizontal_padding)
    local cursor_col = horizontal_padding + vim.api.nvim_strwidth(command_line_text) + 1
    local min_width = vim.api.nvim_strwidth(pretty_keystrokes_so_far)

    local items = get_pretty_items(prefix, prefix_keys, complete_keys)

    local num_rows, num_cols
    if #items == 0 then
      num_rows = 1
      num_cols = 0
    elseif #items < max_num_rows then
      num_cols = 1
      num_rows = #items
    else
      num_cols = math.ceil(#items / max_num_rows)
      num_rows = math.ceil(#items / num_cols)
    end

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
      _set_to_at_least(keystroke_widths, col_num, keystroke_width)
      _set_to_at_least(description_widths, col_num, description_width)

      local display_width = keystroke_widths[col_num] + sep_width + description_widths[col_num]
      _set_to_at_least(col_widths, col_num, display_width)
    end

    local no_mappings_string = '(no mappings)'

    -- Compute col_start[col_num] and the total width of the window's text.
    local col_starts = {}
    local width
    if #items > 0 then
      width = horizontal_padding + 1
      for col_num = 1, num_cols do
        col_starts[col_num] = width
        width = width + horizontal_spacing + col_widths[col_num]
      end
      width = width - horizontal_spacing + horizontal_padding - 1
      width = math.max(width, min_width)
    else
      width = math.max(2 * horizontal_padding + vim.api.nvim_strwidth(no_mappings_string), min_width)
    end

    local max_width = vim.o.columns - 2 * border_width
    if width > max_width then
      max_num_rows = max_num_rows + 1
      goto start_redraw
    end

    vim.api.nvim_buf_set_lines(buf, 0, -1, false, {})
    vim.api.nvim_win_set_config(win, {width = width, height = num_rows + 2})

    local blank_lines = {}
    for _ = 1, num_rows + 2 do
      table.insert(blank_lines, string.rep(' ', width))
    end
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, blank_lines)

    local row_offset = (anchor == 'NW' and 1) or -1

    if #items > 0 then
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
        vim.api.nvim_buf_set_text(buf, row_num + row_offset, description_start-1, row_num + row_offset, description_end, {item.description})
        vim.api.nvim_buf_set_text(buf, row_num + row_offset, sep_start-1, row_num + row_offset, sep_end, {sep})
        vim.api.nvim_buf_set_text(buf, row_num + row_offset, keystroke_start-1, row_num + row_offset, keystroke_end, {item.keystroke})
      end
    else
      vim.api.nvim_buf_set_text(buf, 1 + row_offset, horizontal_padding, 1 + row_offset, horizontal_padding + vim.api.nvim_strwidth(no_mappings_string), {no_mappings_string})
    end

    if anchor == 'NW' then
      vim.api.nvim_buf_set_lines(buf, 0, 1, false, {pretty_keystrokes_so_far})
      vim.api.nvim_buf_set_lines(buf, 1, 2, false, {string.rep('─', width)})
      vim.fn.setcursorcharpos(1, cursor_col)
    else
      vim.api.nvim_buf_set_lines(buf, -2, -1, false, {pretty_keystrokes_so_far})
      vim.api.nvim_buf_set_lines(buf, -3, -2, false, {string.rep('─', width)})
      vim.fn.setcursorcharpos(num_rows + 2, cursor_col)
    end
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

    local make_next_key_cb = function(keystroke)
      return function()
        -- Our state is basically encapsulated by the (prefix, mappings) pair.
        prefix, mappings = prefix .. keystroke, prefix_keys[keystroke] or {}
        -- XXX: Do we really need to have (prefix, mappings) as persistent state?
        full_update()
      end
    end

    for keystroke, _ in pairs(prefix_keys) do
      vim.keymap.set('n', keystroke, make_next_key_cb(keystroke), opts_)
    end

    for keystroke, mapping in pairs(complete_keys) do
      if open_window_callbacks[mapping.callback] then
        vim.keymap.set('n', keystroke, make_next_key_cb(keystroke), opts_)
      else
        local cb = function()
          close_window()
          if mapping.callback then
            mapping.callback()
          elseif mapping.rhs then
            local feedkeys_mode = ''
            if mapping.noremap then
              feedkeys_mode = feedkeys_mode .. 'n'
            else
              feedkeys_mode = feedkeys_mode .. 'm'
            end
            local rhs = vim.api.nvim_replace_termcodes(mapping.rhs, true, true, true)
            vim.api.nvim_feedkeys(rhs, feedkeys_mode, false)
          else
            print(string.format('Error: mapping "%s" has no callback and no RHS', mapping.lhs))
          end
        end
        vim.keymap.set('n', keystroke, cb, opts_)
      end
    end
  end

  local backspace = function()
    local keystrokes = get_keystrokes(prefix)
    if #keystrokes < 1 then
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

local function _run_tests()
  local all_ok = true
  all_ok = all_ok and test_truncate()
  if all_ok then
    print('All tests passed!')
  else
    print('Some tests FAILED!')
  end
  return all_ok
end

local function set(mode, lhs, opts)
  opts = opts or {}
  local cb = function() open_window(lhs) end
  open_window_callbacks[cb] = true
  vim.keymap.set(mode, lhs, cb, opts)
end

return {
  _run_tests = _run_tests,
  open_window = open_window,
  set = set,
}
