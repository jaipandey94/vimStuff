local reselect_last_selection = function (ctx)
	vim.cmd('normal! gv')
	end
require('Comment').setup(
{
    ---Add a space b/w comment and the line
    padding = true,
    ---Whether the cursor should stay at its position
    sticky = true,
    ---Lines to be ignored while (un)comment
    ignore = nil,
	post_hook = reselect_last_selection,
})
