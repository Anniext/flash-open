local M = {}

local function get_currentpwd()
  local path = vim.fn.getcwd()
  return path
end

function M.open()
  local path = get_currentpwd()
  if path ~= '' then
    local cmd = string.format("open -R \"%s\"", path)
    os.execute(cmd)
    print('Path opened with Finder: ' .. path)
  else
    print('Clipboard is empty')
  end
end

function M.setup()
  vim.cmd('command! Openfinder :lua require(\'local.M\').open()')
end

return M
