local autocmd = vim.api.nvim_create_autocmd
local mypy_namespace = vim.api.nvim_create_namespace('mypy')


function os.capture(cmd)
  local f = assert(io.popen(cmd, 'r'))
  local s = assert(f:read('*a'))
  f:close()
  return s
end

if not table.unpack then
    table.unpack = unpack
end

local mypy_augroup = vim.api.nvim_create_augroup("mypy_format", {})

local au_callback = function(ev)
    curr_file = vim.api.nvim_buf_get_name(0)
    if string.sub(curr_file, #curr_file - 2, #curr_file) ~= ".py" then
        return
    end
    vim.schedule(function() 
        local lint_output = os.capture("mypy --no-pretty --no-color-output " .. curr_file)
        local diagnostics = {}
        for line in string.gmatch(lint_output, "[^\r\n]+") do
            words = {}
            for word in string.gmatch(line, "[^%s]+") do
                table.insert(words, word)
            end
            location = words[1]
            line = string.gmatch(location, ".py:([0-9]+):")()
            col = string.gmatch(location, ".py:[0-9]+:([0-9]+):")()
            if line ~= nil and #line > 0 then
                table.insert(diagnostics, {
                    bufnr = 0,
                    lnum = tonumber(line) - 1,
                    end_lnum = tonumber(line) - 1,
                    col = tonumber(col) - 1,
                    end_col = 300,
                    severity = vim.diagnostic.severity.WARN,
                    message = table.concat({table.unpack(words, 3, #words - 1)}, " ") .. " - " .. words[#words],
                    source = 'mypy',
                    sign = 'T'
                })
            end
        end

        vim.diagnostic.set(mypy_namespace, 0, diagnostics)
    end)
end

autocmd({"BufWritePost", "BufWinEnter"}, {
    group = mypy_augroup,
    callback = au_callback,
})
