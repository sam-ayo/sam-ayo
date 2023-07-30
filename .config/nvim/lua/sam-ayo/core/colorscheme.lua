local status, _ = pcall(vim.cmd, "colorscheme embark")
if not status then 
    print("Colorscheme not found!")
    return
end
