--local M = {}

-- so, okay, this is how we get information from the user
-- and it's being passed in as a table
-- so, in whatever docs we'll have for this, we can just say
-- "oh, set the value of x to something you want"
-- and then in this function we just check the value of key x
-- in the table 'parameters'
local function setup(parameters)
    print("funny fox")
end

local function assemble()
    local filename = vim.api.nvim_eval_statusline('%f %m %l/%L', {}).str

    -- temp so i remember how to format things later
    local zed = string.format('%s', filename)
    return zed
end

-- might need to add more trigger events for this; probably will need to
-- when i add in the normal/insert/visual stuff
vim.api.nvim_create_autocmd({"BufWrite", "BufModifiedSet", "CursorMoved", }, {
    callback = function()
        vim.o.statusline = assemble()
    end
})

return {
    setup = setup,
}
--return M
