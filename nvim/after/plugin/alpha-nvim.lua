local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

-- Set header
dashboard.section.header.val = {
"    ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ⢀⣴⠟⠷⣶⣾⣿⣿⣿⠿⠶⠶⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⠟⡥⠢⢄⡀⠉⠉⠁⢀⣀⠤⡀⢸⣷⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⢸⣀⡀⣀⠉⡇⢠⠋⠉⠀⠀⠘⡄⢿⣿⣦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⡶⢛⡻⠿⠚⠢⣤⠭⠛⠁⠘⣖⠒⢚⠛⣤⢃⣿⣿⣿⣧⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⢡⠋⠀⠀⠀⠀⠁⠢⠤⠄⠤⠋⠉⠉⠉⠉⠙⠻⣿⣿⡿⠷⠶⢦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⢀⣀⠀⠀⠀⠀⠀⠀⢸⡏⠀⠀⢀⣀⠤⣴⠖⠲⡦⠤⢄⡀⠀⠀⠀⠀⠀⠈⣏⠴⢖⠂⠀⢿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⣠⣴⣾⣿⣿⣿⣿⣦⡀⠀⠀⠀⠸⣧⠀⡔⡹⡄⢰⠹⡀⡰⢹⠀⡰⡏⠑⢄⠀⠀⠀⠀⢸⠀⠀⠀⣠⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⡄⠀⠀⠀⣿⢸⢣⡇⠱⠇⣀⣛⣁⠘⠖⠁⡇⡠⢺⢣⠀⠀⠀⣸⠶⠶⠟⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⢰⣿⣿⣿⣿⠋⠉⠻⣿⣿⣿⣿⡄⠀⠀⠹⢦⣙⣋⣉⠉⠁⠀⠀⠉⠑⠢⢭⣀⣸⡜⢠⣧⣴⣿⣷⣶⣶⣤⣤⣄⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⢿⣿⣿⣿⣿⡄⠀⠀⢿⣿⣿⣿⡇⠀⠀⠀⠀⢈⣩⣿⣦⠀⠀⠀⠀⠀⠀⣲⣤⣤⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣶⣾⣿⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⢻⣿⣿⣿⣿⠀⠀⢸⣿⣿⣿⣿⠀⠀⠀⣠⣿⣿⡿⠉⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠛⠁⠈⠉⠩⡉⠛⠛⠛⠶⠶⢦⣤⣀⠀",
"⠀⠀⠙⠛⠛⠁⠀⠀⢸⣿⣿⣿⣿⠀⠀⣰⣿⣿⡟⠀⠀⠀⠀⠀⠀⠀⠘⢻⣿⣿⣿⡏⠉⠉⠛⠛⠿⠿⢿⣿⣿⣿⣿⣿⣟⠀⠠⡠⠀⠀⣰⠠⢀⣀⠀⠀⠀⠀⠙⣷",
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⡄⢰⣿⣿⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠘⢻⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠉⠛⠻⢿⣿⣄⠀⠣⣀⣔⠁⠀⠀⣿⠛⠷⠶⠶⠾⠋",
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣇⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⠷⣼⡅⠈⠉⠂⣿⠁⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠀⣀⣨⣿⣿⣿⣿⣿⣿⣿⣿⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠛⠟⠛⠁⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣧⣴⣶⣿⣷⣤⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⢰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠈⣿⣿⣿⣿⣿⣿⣿⣿⣿⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠈⢿⣿⣿⣿⣿⣿⣿⣿⣿⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⣀⣴⠶⠛⠛⠉⢻⣿⣿⣿⣿⣷⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⣿⣿⣿⣿⣿⣿⣿⣿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⢀⡾⢫⠖⢁⠔⠂⢀⡻⠋⠛⠻⠟⠻⠻⣷⣦⣤⣀⣀⣀⣀⣤⡶⠛⠉⠉⠙⠉⠉⢁⡈⠉⢝⢷⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠘⢧⣇⣠⡣⠔⢚⡡⠀⢀⠀⠀⠀⠀⠀⠈⠻⢿⡏⠉⠀⠀⠉⠉⠉⠉⠙⠓⢦⡀⠀⠈⢢⠀⠳⡹⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠙⣿⡠⠒⢉⠔⠊⠁⠀⣠⠶⠒⠶⣄⣀⡸⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢦⣀⣀⣇⣀⣷⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠈⠳⠶⢾⣤⡤⠴⠊⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠉⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
}

-- Set menu
dashboard.section.buttons.val = {
    dashboard.button( "e", "  > New file" , ":ene <BAR> startinsert <CR>"),
    dashboard.button( "SPC f f", "  > Find file", "<leader>ff"),
    dashboard.button( "r", "  > Recently opened files"   , ":Telescope oldfiles<CR>"),
    dashboard.button( "SPC f s", "\xF0\x9F\x94\x8D > Find text" , "<leader>fs"),
    dashboard.button( "SPC q", "  > Quit NVIM", ":qa<CR>"),
}

alpha.setup(dashboard.opts)

