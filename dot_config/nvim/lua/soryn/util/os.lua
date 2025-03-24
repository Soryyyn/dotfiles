local M = {}

function M.get_os()
    if vim.fn.has('linux') == 1 then
        return 'linux'
    elseif vim.fn.has('mac') == 1 then
        return 'mac'
    else
        return 'win'
    end
end

return M
