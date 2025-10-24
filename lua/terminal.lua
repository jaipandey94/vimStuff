-- Terminal Keybinds
-- Autocmd to always be in insert mode when going into the terminal
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter", "WinEnter" }, {
  pattern = "term://*",
  command = "startinsert",
})

function SwitchToTerminal()
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_loaded(buf) then
      local name = vim.api.nvim_buf_get_name(buf)
      if name:match("^term://") then
        -- Find the window displaying this terminal, if any
        for _, win in ipairs(vim.api.nvim_list_wins()) do
          if vim.api.nvim_win_get_buf(win) == buf then
            vim.api.nvim_set_current_win(win)
            return
          end
        end
        -- If terminal buffer exists but not shown in a window, just switch to it
        vim.api.nvim_set_current_buf(buf)
        return
      end
    end
  end
 OpenFloatingTerminal()
end

-- Function to open a floating terminal with a border
function OpenFloatingTerminal()
  local buf = vim.api.nvim_create_buf(false, true)  -- Create a scratch buffer
  local width = vim.o.columns
  local height = math.floor(vim.o.lines * 0.15)
  local row = vim.o.lines - height
  local col = 0

  local win = vim.api.nvim_open_win(buf, true, {
    relative = 'editor',
    width = width,
    height = height,
    row = row,
    col = col,
    style = 'minimal',
    border = 'rounded', -- or "single", "double", "solid", "shadow", or custom chars
  })

  -- Start terminal in the new buffer
  vim.fn.termopen(vim.o.shell)
  vim.cmd("startinsert")
end

vim.api.nvim_create_user_command("SwitchToTerminal", SwitchToTerminal, {}) 
vim.cmd.nnoremap("<leader>tt", "<CMD>SwitchToTerminal <CR>") -- Launch Terminal
vim.cmd.tnoremap("<Esc>", "<C-\\><C-n>") -- Escape from Terminal
vim.cmd.tnoremap("<C-w>", "<C-\\><C-n><C-w>") -- Escape from Terminal

