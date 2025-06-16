_G.git_branch = function()
  local handle = io.popen("git rev-parse --abbrev-ref HEAD 2>/dev/null")
  if handle then
    local branch = handle:read("*l")
    handle:close()
    if branch and branch ~= "" then
      return " " .. branch
    end
  end
  return ""
end

vim.o.statusline = table.concat {
  " %{v:lua.git_branch()}",
  " %f",                -- relative file path
  " %m",               -- modified flag [+]
  " %= ",
  " %y",             -- filetype
  " %l:%c",
  " / %L",
  " %p%% ",             -- percentage through file
}
