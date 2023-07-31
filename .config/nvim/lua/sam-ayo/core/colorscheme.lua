local g = vim.g


-- Everforest configurations
g.everforest_background = 'hard'
g.everforest_better_performance = 1
g.everforest_enable_italic = 1
g.everforest_diagnostic_text_highlight = 1


local status, _ = pcall(vim.cmd, "colorscheme everforest")
if not status then 
    print("Everforest not found!")
    return
end
