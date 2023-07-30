local setup, telescope = pcall(require, "telescope")
if not setup then
    print("Cannot find telescope")
    return
end

telescope.load_extension("fzf")
