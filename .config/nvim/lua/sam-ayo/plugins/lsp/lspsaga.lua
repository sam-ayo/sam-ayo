local saga_setup, saga = pcall(require, "lspsaga")
if not saga_setup then
	print("Cannot find lspsaga")
	return
end

saga.setup({
	move_in_saga = { prev = "<C-k>", next = "<C-j>" },
	finder_action_keys = {
		open = "<CR>",
	},
	definition_action_keys = {
		edit = "<CR>",
	},
})
