local M = {}

function M.new_section(name, action, section)
  return {
    name = name,
    action = action,
    section = string.rep(" ", 22) .. section,
  }
end

return M
