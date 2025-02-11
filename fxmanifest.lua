fx_version 'cerulean'
game 'gta5'

author 'TrAsKiN'
description 'A dashboard for FiveM'

dependencies {
    '/client:12767',
}

files {
    'data/vehicles.json',
    'interface/fonts/oxanium.ttf',
    'interface/hud.css',
    'interface/hud.html',
    'interface/hud.js',
    'interface/reboot.css',
}

ui_page 'interface/hud.html'

client_scripts {
    'client/hud.lua',
}

exports {
    'registerSeatbeltFunction',
    'registerSpeedLimitFunction',
}
