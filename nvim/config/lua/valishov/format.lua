-- TODO: make this more reliable - what about checking the exit code?
-- or parsing the output of the tools? Can this be generalized including myoy plugin?
-- The only difference is another parser.
local Format = {
    python = function()
        local filename = vim.api.nvim_buf_get_name(0)
        os.execute("black " .. filename .. " &> /dev/null")
        os.execute("ruff --fix " .. filename .. " &> /dev/null")
        vim.api.nvim_command("e!")
        return true
    end,
}

function format()
    if (Format[vim.bo.filetype]()) then
        print("Formatted!")
    end
end

vim.keymap.set("n", "<C-f>", format, {})
vim.keymap.set("i", "<C-f>", format, {})
