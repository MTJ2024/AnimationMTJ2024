-- ============================================================
--   AnimationMTJ2024 © 2024 MTJ2024 | All Rights Reserved
--   Unauthorized redistribution is strictly prohibited.
-- ============================================================

fx_version 'cerulean'
game      'gta5'

author      'MTJ2024'
description '🎭 AnimationMTJ2024 – Professionelles Animations-Menü für ESX Legacy'
version     '1.0.0'

lua54 'yes'

shared_scripts {
    'config.lua',
}

client_scripts {
    'client/main.lua',
}

server_scripts {
    'server/main.lua',
}

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/style.css',
    'html/app.js',
}
