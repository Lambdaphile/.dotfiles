local M = {}

function M.make_header()
  local cowsay = vim.fn.system("fortune -s -n 40 | cowsay")
  local indent = string.rep(" ", 8)
  local cowsay_header = vim.split(cowsay, "\n")

  for i, line in ipairs(cowsay_header) do
    if line == "" then
      table.remove(cowsay_header, i)
    else
      cowsay_header[i] = indent .. line
    end
  end

  return table.concat(cowsay_header, "\n")
end

function M.make_section(name, items)
  local section = {}
  local indent = string.rep(" ", 22)

  for i, item in ipairs(items) do
    section[i] = {
      name = item[1],
      action = item[2],
      section = indent .. name,
    }
  end

  return section
end

return M
